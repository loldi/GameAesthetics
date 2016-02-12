//-----------------------------------------------------------------------------------------------------------
// GAME AESTHETICS: C++ Text Parser Part 3
//-----------------------------------------------------------------------------------------------------------
#include <iostream>
#include <cctype>
#include <string>

using namespace std;

// here we will use:
	
	// isspace(charVariable)	- here we can find out if the char variable is a space.
	//							- we'll use this to split our string.
	//


int main() {

	string verbs[] = {"TAKE", "GET", "JUMP", "ATTACK", "RUN", "GO", "TURN"};

	string noun[] = {"GEM", "AX", "STICK", "COOKIE", "NORTH", "SOUTH", "EAST", "WEST"};

	string command;
  	cout << "Type a command: ";
  	getline (cin,command);
  	cout << "\n";
	for (int i = 0; i < command.size(); i++) {
		command.at(i) = toupper(command.at(i));
	}

	string word1 = "";
	string word2 = "";

	string sentence[] =  {"", "", "", ""};

	string POS1 = "";
	string POS2 = "";

	char c;	//we'll use c to store the current character and see if its a space.

	int arrayPos = 0;




	for (int i = 0; i < command.size(); i++) {
		c = command.at(i);	//get the current character,
		if (isspace(c) && word1 != "") { //if the character is a space and word1 isn't empty,
			break;	//break out of the for loop.
		} 
		if (!isspace(c)) {  //if its a letter, 
			word1 += c;     //add the char to word1. we can use += here! 
		} 
	}

	//here we'll loop again, but starting from the end of word1!
	for (int i = word1.size(); i < command.size(); i++) {
		c = command.at(i);
			
			if (isspace(c) && word2 != "") { //if the character is a space and word1 isn't empty,
				break;	//break out of the for loop.
		} 

		if (!isspace(c)) { //if the character isn't a space, add it to word 2.
			word2 += c;
		} 
	}

	for (int i = 0; sizeof(verbs)/sizeof(verbs[0]); i++){

		if (word1.compare(verbs[i]) == true){

			cout << "Word 1 is a verb" << endl;
			sentence[arrayPos] = word1;
			arrayPos++;
			break;

		}  else {

			cout << "word 1 is not a verb" << endl;
		}
	}

	for (int i = 0; sizeof(verbs)/sizeof(verbs[0]); i++){

		if (word2.compare(verbs[i]) == true){

			cout << "Word 2 is a verb" << endl;
			sentence[arrayPos] = word2;
			arrayPos++;
		

		}  else {

			cout << "word 2 is not a verb" << endl;
			
		}
		
		break;
	}


	// for (int i = 0; sizeof(noun)/sizeof(noun[0]); i++){

	// 	if (word2 == noun[i]){

	// 		cout << "Word 2 is a noun" << endl;
	// 		POS1 = "NOUN";
	// 		sentence[arrayPos] = word2;
	// 		arrayPos++;
	// 		break;
	// 	} 
	// 	break;
	// }
 
	//cout << "Your command " << word1 << " " << word2 << endl;
	//cout << "Contains a " << POS1 << " and a " << POS2 << endl;

	cout << sentence[0] << " " << sentence[1] << endl;
	//cout << word1 << " " << word2 << endl;

	//EXERCISE:___________________________________
	
	//1:
	//what happens if you enter more than two words?
	//try to solve this in two ways:
			// - only accept the first two words of any command.
			// - only accept the first and last words of any command.


	//2:
	//make an array of strings that will get recognized by the parser, like "LOOK", "GO", "GET", etc.
	//loop through the array to see if the command is recognized, then use a switch to display a custom response.


	//if you're comfortable with the above, try...
	//3: (ADVANCED)
	//if you're feeling brave, try to put this all into a function that will return an array of strings.
	//this is actually a trick question. but spend some time looking into why.
	//if you can't do it, psuedocode it, or try it in another language. look at how "split" works in processing for example.
	//_____________________________________________

	return 0;
}