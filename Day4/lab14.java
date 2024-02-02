public class lab14 {
    public static void main(String[] args) {
        // Example usage
        ANDGate andGate = new ANDGate();
        ORGate orGate = new ORGate();
        NOTGate notGate = new NOTGate();

        // Test cases
        System.out.println("AND Gate:");
        System.out.println("TRUE | TRUE: "+andGate.performOperation(true, true)); // print true
        System.out.println("TRUE | FALSE: "+andGate.performOperation(true, false)); // print false
        System.out.println("FALSE | TRUE: "+andGate.performOperation(false, true)); // print false
        System.out.println("FALSE | FALSE: "+andGate.performOperation(false, true)); // print false
        
        System.out.println("\nOR Gate:");
        System.out.println("TRUE | TRUE: "+orGate.performOperation(true, true)); // print true
        System.out.println("TRUE | FALSE: "+orGate.performOperation(true, false)); // print true
        System.out.println("FALSE | TRUE: "+orGate.performOperation(false, true)); // print true
        System.out.println("FALSE | FALSE: "+orGate.performOperation(false, false)); // print false

        System.out.println("\nNOT Gate:");
        System.out.println("FALSE: "+notGate.performOperation(false)); // print true
        System.out.println("TRUE: "+notGate.performOperation(true)); // print false
    }
}

// Interface for a basic logic gate
interface LogicGate {
    boolean performOperation(boolean input1, boolean input2);

    boolean performOperation(boolean input);
}

// AND Gate implementation
class ANDGate implements LogicGate {
    @Override
    public boolean performOperation(boolean input1, boolean input2) {
        return input1 && input2;
    }

    @Override
    public boolean performOperation(boolean input) {
        // For AND gate, this method is not used, AND needs two inputs
        throw new UnsupportedOperationException("Single input NOT supported for AND gate");
    }
}

// OR Gate implementation
class ORGate implements LogicGate {
    @Override
    public boolean performOperation(boolean input1, boolean input2) {
        return input1 || input2;
    }

    @Override
    public boolean performOperation(boolean input) {
        // For OR gate, this method is not used, OR needs two inputs
        throw new UnsupportedOperationException("Single input NOT supported for OR gate");
    }
}

// NOT Gate implementation
class NOTGate implements LogicGate {
    @Override
    public boolean performOperation(boolean input1, boolean input2) {
        // For NOT gate, this method is not used, NOT needs only 1 input
        throw new UnsupportedOperationException("Two inputs NOT supported for NOT gate");
    }

    @Override
    public boolean performOperation(boolean input) {
        return !input;
    }
}
