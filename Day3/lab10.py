def tower_of_hanoi(n, source, target, auxiliary):
    if n > 0:
        # Move n-1 disks from source to auxiliary peg
        tower_of_hanoi(n-1, source, auxiliary, target)
        
        # Move the nth disk from source to target peg
        print(f"Move disk {n} from {source} to {target}")
        
        # Move the n-1 disks from auxiliary peg to target peg
        tower_of_hanoi(n-1, auxiliary, target, source)

# Take user inputs
number_of_disks = int(input("Enter the number of disks: "))
source_peg = input("Enter the source peg name: ")
target_peg = input("Enter the target peg name: ")
auxiliary_peg = input("Enter the auxiliary peg name: ")

# Call the function with user inputs
tower_of_hanoi(number_of_disks, source_peg, target_peg, auxiliary_peg)
