import 'dart:io';

void main() {
  LinkedList l1 = LinkedList();
  while (true) {
    print('\n\n1. Display the contents of Linked List');
    print('2. Insert data at the beginning');
    print('3. Insert data at the end');
    print('4. Insert data at a particular position');
    print('5. Delete data at a particular position');
    print('6. EXIT');
    print('\nEnter your choice below: ');

    int position;
    int newData;
    int choice = int.parse(stdin.readLineSync());

    // Invalid choice
    if (choice < 1 || choice > 6) {
      print('ERROR: Invalid choice \nPlease enter appropriate value\n\n');
    }

    // Display the list
    else if (choice == 1) {
      l1.printList();
    }

    // Insert at the beginning
    else if (choice == 2) {
      print('Enter the number you want to insert:');
      newData = int.parse(stdin.readLineSync());
      l1.insertAtBeginning(newData);
    }

    // Insert at the end
    else if (choice == 3) {
      print('Enter the number you want to insert:');
      newData = int.parse(stdin.readLineSync());
      l1.insertAtEnd(newData);
    }

    // Insert at a particular position
    else if (choice == 4) {
      print('Enter the number you want to insert:');
      newData = int.parse(stdin.readLineSync());
      print('Enter the position:');
      position = int.parse(stdin.readLineSync());
      l1.insertAtPosition(newData, position);
    }

    // Delete at a position
    else if (choice == 5) {
      print('Enter the position:');
      position = int.parse(stdin.readLineSync());
      l1.deleteAtPosition(position);
    }

    // Exit
    else if (choice == 6) {
      return;
    }
  }
}

class Node {
  int data;
  Node next;

  Node({this.data});
}

class LinkedList {
  Node head = Node(data: null);
  int size;

  LinkedList({this.size = 0});

  insertAtEnd(newData) {
    Node node = Node(data: newData);
    var current;
    current = this.head;
    while (current.next != null) {
      current = current.next;
    }
    current.next = node;
    this.size++;
  }

  insertAtPosition(newData, position) {
    if (position < 0 && position > this.size)
      return;
    else {
      var node = new Node(data: newData);
      var curr, prev;

      curr = this.head;

      if (position == 0) {
        print('ERROR: Invalid choice \nPlease Enter a number greater than 0');
        return;
      } else {
        int i = 0;
        while (i < position) {
          i++;
          prev = curr;
          curr = curr.next;
        }
        node.next = curr;
        prev.next = node;
      }
      this.size++;
    }
  }

  insertAtBeginning(newData) {
    insertAtPosition(newData, 1);
  }

  deleteAtPosition(position) {
    if (position > 0 && position > this.size) {
      print('ERROR: Invalid position');
      return;
    } else {
      var curr, prev, i = 0;
      curr = this.head;
      prev = curr;

      if (position == 0) {
        print('ERROR: Invalid choice \n Can not delete HEAD');
        return;
      } else {
        while (i < position) {
          prev = curr;
          curr = curr.next;
          i++;
        }

        prev.next = curr.next;
      }
      this.size--;

      // return curr.element;
    }
  }

  printList() {
    var curr = this.head;
    String str = "HEAD ";
    while (curr != null) {
      str = str + curr.data.toString() + " --> ";
      curr = curr.next;
    }
    if (curr == null) {
      str = str + "null";
    }
    print('----------------------------------------\n' + str);
  }
}
