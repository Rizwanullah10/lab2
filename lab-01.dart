import 'dart:io';

class TaskItem {
  int id;
  String description;
  bool isCompleted;

  TaskItem(this.id, this.description) : isCompleted = false;

  void showTask() {
    print('-----------------------------------------');
    print('Task ID: $id');
    print('Description: $description');
    print('Status: ${isCompleted ? 'Completed' : 'Not completed'}');
  }

  void markAsCompleted() {
    isCompleted = true;
  }
}

class TaskManager {
  var taskList = <TaskItem>[];
  int currentId = 1;

  void addNewTask() {
    print('Please enter the task description:');
    String? userInput = stdin.readLineSync();

    if (userInput != null && userInput.isNotEmpty) {
      TaskItem newTask = TaskItem(currentId, userInput);
      taskList.add(newTask);
      currentId++;
      print('Task added successfully.');
    } else {
      print('Error: Task description cannot be empty.');
    }
  }

  void displayAllTasks() {
    if (taskList.isEmpty) {
      print('No tasks found.');
    } else {
      taskList.forEach((task) {
        task.showTask();
      });
    }
  }

  void deleteTask() {
    print('Enter the ID of the task to remove: ');
    String? input = stdin.readLineSync();
    if (input != null && int.tryParse(input) != null) {
      int taskId = int.parse(input);
      this.taskList.removeWhere((task) => task.id == taskId);
      print('Task with ID $taskId removed.');
    } else {
      print('Invalid ID.');
    }
  }

  void completeTask() {
    print('Enter the Task ID you wish to mark as completed:');
    String? userInput = stdin.readLineSync();
    if (userInput != null && int.tryParse(userInput) != null) {
      int taskId = int.parse(userInput);
      for (TaskItem task in taskList) {
        if (task.id == taskId) {
          task.markAsCompleted();
          print('Task with ID $taskId marked as completed.');
          return;
        }
      }
      print('No task found with ID $taskId.');
    } else {
      print('Error: Invalid ID format.');
    }
  }
}

void main() {
  TaskManager manager = TaskManager();
  bool isRunning = true;

  while (isRunning) {
    print('\n1. Add Task');
    print('2. View All Tasks');
    print('3. Delete Task');
    print('4. Mark Task as Completed');
    print('5. Exit');
    stdout.write('Select an option: ');

    String? option = stdin.readLineSync();
    switch (option) {
      case '1':
        manager.addNewTask();
        break;
      case '2':
        manager.displayAllTasks();
        break;
      case '3':
        manager.deleteTask();
        break;
      case '4':
        manager.completeTask();
        break;
      case '5':
        print('Exiting the application...');
        isRunning = false;
        break;
      default:
        print('Error: Please select a valid option.');
    }
  }
}