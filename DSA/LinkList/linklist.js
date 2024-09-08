/**
 * Represents a node in a linked list.
 * @class
 * @param {*} data - The data to be stored in the node.
 * @property {*} data - The data stored in the node.
 * @property {Node} next - The reference to the next node in the linked list.
 */
class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
    }

    /**
     * Adds a new node with the given data to the linked list.
     * 
     * @param {*} data - The data to be added to the linked list.
     * @returns {void}
     */
    add(data) {
        const newNode = new Node(data);

        if (!this.head) {
            this.head = newNode;
        } else {
            let current = this.head;
            while (current.next) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    /**
     * Displays the elements of the linked list.
     */
    display() {
        let current = this.head;
        while (current) {
            console.log(current.data);
            current = current.next;
        }
    }
    /**
     * Searches for a specific data in the linked list.
     * @param {*} data - The data to search for.
     * @returns {boolean} - True if the data is found, false otherwise.
     */
    search(data) {
        let current = this.head;
        while (current) {
            if (current.data === data) {
                return true;
            }
            current = current.next;
        }
        return false;
    }
    /**
     * Removes a node with the specified data from the linked list.
     * 
     * @param {*} data - The data to be removed from the linked list.
     * @returns {void}
     */
    remove(data) {
        if (!this.head) return;

        // If head node itself holds the data
        if (this.head.data === data) {
            this.head = this.head.next;
            return;
        }

        let current = this.head;
        let previous = null;

        // Search for the node to be deleted
        while (current && current.data !== data) {
            previous = current;
            current = current.next;
        }

        // If the data is not found
        if (!current) return;

        // Unlink the node from the linked list
        previous.next = current.next;
    }

    /**
     * Returns the length of the linked list.
     *
     * @returns {number} The length of the linked list.
     */
    getLength() {
        let current = this.head;
        let count = 0;

        while (current) {
            count++;
            current = current.next;
        }

        return count;
    }

    /**
     * Inserts a new node with the given data at the specified index in the linked list.
     * 
     * @param {*} data - The data to be inserted into the new node.
     * @param {number} index - The index at which the new node should be inserted.
     * @returns {void}
     */
    insertAt(data, index) {
        const newNode = new Node(data);

        if (index < 0) {
            console.log("Index must be a positive number");
            return;
        }

        if (index === 0) {
            newNode.next = this.head;
            this.head = newNode;
            return;
        }

        let current = this.head;
        let previous = null;
        let count = 0;

        while (current && count < index) {
            previous = current;
            current = current.next;
            count++;
        }

        if (count === index) {
            previous.next = newNode;
            newNode.next = current;
        } else {
            console.log("Index out of bounds");
        }
    }

    /**
     * Reverses the linked list.
     */
    reverse() {
        let prev = null;
        let current = this.head;
        let next = null;

        while (current) {
            next = current.next;
            current.next = prev;
            prev = current;
            current = next;
        }

        this.head = prev;
    }

    /**
     * Retrieves the value of the nth node from the end of the linked list.
     *
     * @param {number} n - The position of the node from the end of the linked list.
     * @returns {*} - The value of the nth node from the end of the linked list, or null if the list has fewer nodes than n.
     */
    getNthFromEnd(n) {
        let mainPtr = this.head;
        let refPtr = this.head;

        let count = 0;
        if (this.head) {
            while (count < n) {
                if (!refPtr) return null; // List has fewer nodes than n
                refPtr = refPtr.next;
                count++;
            }

            while (refPtr) {
                mainPtr = mainPtr.next;
                refPtr = refPtr.next;
            }
            return mainPtr.data;
        }
        return null;
    }

    /**
     * Detects if a loop exists in a linked list.
     * @returns {boolean} True if a loop is detected, false otherwise.
     */
    detectLoop() {
        let slowPtr = this.head;
        let fastPtr = this.head;

        while (slowPtr && fastPtr && fastPtr.next) {
            slowPtr = slowPtr.next;
            fastPtr = fastPtr.next.next;

            if (slowPtr === fastPtr) {
                return true;  // Loop detected
            }
        }
        return false;  // No loop
    }

    /**
     * Finds the middle element of a linked list.
     * @returns {any} The data of the middle element, or null if the list is empty.
     */
    findMiddle() {
        let slowPtr = this.head;
        let fastPtr = this.head;

        while (fastPtr && fastPtr.next) {
            slowPtr = slowPtr.next;
            fastPtr = fastPtr.next.next;
        }

        return slowPtr ? slowPtr.data : null;
    }

}

// Example usage:
const list = new LinkedList();
list.add(1);
list.add(2);
list.add(3);
list.display();