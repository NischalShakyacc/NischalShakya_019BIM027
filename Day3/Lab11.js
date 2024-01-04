//Goal to reach for program to end
const goalState = {
    monkey : 'ON_CHAIR',
    banana : 'C',
    chair : 'C',
}

// Inital positions of monket banana and chair
const currentState = {
    monkey : 'A',
    banana : 'C',
    chair : 'B',
}

const possibleActions = ['walk', 'push', 'climb', 'jump'];

const checkState = (state) =>{
    if(
        state.monkey === 'ON_CHAIR' &&
        state.banana === 'C' &&
        state.chair === 'C'
    ){
        return false;
    }
    return true;
}


    let action = prompt("Enter action: Actions can be ['walk', 'push', 'climb', 'jump']");

    if(possibleActions.includes(action)){
        if(action === 'walk'){
            if(currentState.monkey === 'A'){
                console.log('Monkey went to B');
                currentState.monkey = 'B';
                console.log(currentState);
            }

            if(currentState.monkey === 'B') currentState.monkey = 'C';

            if(currentState.monkey === 'C') currentState.monkey = 'A';

            console.log('After if');
            console.log(currentState);
        }
        else if(action === 'push'){
            if(currentState.monkey === 'B' && currentState.chair === 'B'){
                currentState.chair = 'C';
                currentState.monkey = 'C';
            }else{
                alert('Monkey is far');
            }
        }
    }else{
        console.log('Invalid Action');
    }
    
/*
do{
}while(checkState({monkey: 'ON_CHAIR', banana: 'A', chair: 'C'}))*/