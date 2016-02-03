#include <iostream>

using namespace std;

	

int main(){

	const int COLS = 30;
	const int ROWS = 15;
	char grid[COLS][ROWS];

	for (int i = 0; i < ROWS; i++){

		for(int j = 0; j < COLS; j++){

			grid[j][i] = ' ';

			cout << grid[j][i];
		}
		cout << endl;
	}


	char input;

	int Px = 2;
	int Py = 13;

	int Ex = 7 + (rand() % (int)(15 - 7 + 1));
	
	int Ey = 13;

	int score = 0;

	bool gameOver = false;


	while (input != 'q'){

		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << "Score:" << endl;
		cout << score << endl;

		Ex--;

		for (int i = 0; i < COLS; i++){

			grid[i][14] = '-';
		}

		grid[Ex][Ey] = '#';

		grid[Px][Py] = 'P';

	if (input == 'w' && Py > 12){

		Py--;

	} else if (input != 'w' && input != 'q' && Py < 13){

		Py++;
	}

	if (Px == Ex && Py < Ey){
		score++;
	}

	if (Px == Ex && Py == Ey){
		gameOver = true;
	}
	if (gameOver){

		Ex = -1;
		Px = -1;

		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << "GAME OVER" << endl;
		cout << "Your score is: " << endl;
		cout << score << endl;
		cout << " " << endl;
		cout << " " << endl;
		cout << "Enter T to restart" <<endl;
	}

	if (Ex == 0){
		Ex = 7 + (rand() % (int)(15 - 7 + 1));
	} else if (Ex == 0 && Py == 12){
		Ex = 7 + (rand() % (int)(15 - 7 + 1));
		Ey = 12;
	}

	if (gameOver && input == 't'){

		Px = 2;
		Ex = 7 + (rand() % (int)(15 - 7 + 1));
		score = 0;
		gameOver = false;
	}
		

		for (int i = 0; i < ROWS; i++){

		for(int j = 0; j < COLS; j++){

			cout << grid[j][i];
		}
		cout << endl;
	}


		for (int i = 0; i < ROWS; i++){

		for(int j = 0; j < COLS; j++){

			grid[j][i] = ' ';
		}
	}

	cin >> input;

	}
	return 0;
}