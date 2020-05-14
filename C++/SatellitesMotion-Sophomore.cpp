/*Program name: Satellite's Motion
Author: Dimitrije Prosevski
Date last updated: 12/10/2017
Purpose: Final Project */

/*
***Description***
Class Planet has 2 objects (Original planet, the first planet user chooses, and Comparison Planet, the second planet user chooses).
Project is planned to perform all the functions that are provided in the class "Planet" using parameters that user inputs for desired satellite/probe.
Each satellite/probe on different planet will have different values because of the unique conditions of each planet.
Counter goes up to 2, when counter = 1, original planet object will store its values.
When counter = 2, comparison planet object will store its values.
In the end, satellites are compared with the table. Users is asked to repeat or quit.
If repeat is chosen all the variables get reseted and reinitialized.
*/

#include <cmath>
#include <iostream>
#include <string>
#include <iomanip>
#include <cstdlib>
#include <ctype.h>

using namespace std;

class Planet
{

public:
    //variables
	string name; //planet's name
	string sname; //satellite's name
	double T; //temperature
	double M; //mass of a planet
	double g; //gravity
    double m; //mass
    double alt; //altitude
	double r; //radius of a planet
	double F; //gravitational force
	double V; //orbital velocity
	double Vesc; //escape velocity
	double a; //acceleration
	double P; //period
    double L; //momentum
    double ecc; //eccentricity
    double d; //semi-major axis
    double aph; //aphelion variable
	double per; //perihelion variable
	const double G = 6.673e-11; //constant = 6.673 x 10^-11 N•m2 / kg2

    //planet's interface
    void planetI();

    //planets' parameters
    void Mercuryparam();
    void Venusparam();
    void Earthparam();
    void Marsparam();
    void Jupiterparam();
    void Saturnparam();
    void Uranusparam();
    void Neptuneparam();
    void Xparam();

    //calculating functions
	double surfaceWeight();
	double orbitalRadius();
	double gForce();
	double orbitalVel();
	double escapeVel();
	double acceleration();
	double momentum();
	double period();
	double sAxis();
	double aphelion();
	double perihelion();
};


//END OF CLASS------------------------------------------->   PLANET PARAMETERES FUNCTIONS START
void Planet::Mercuryparam(){
        name = "Mercury";
        g = 3.7;
        r = 1516000;
        M = 3.285e+23;
        T = 167;
}

void Planet::Venusparam(){
        name = "Venus";
        g = 8.87;
        r = 3760000;
        M = 4.867e+24;
        T = 462;
}

void Planet::Earthparam() {
        name = "Earth";
        g = 9.81;
        r = 6371000;
        M = 5.972e+24;
        T = 16;
}

void Planet::Marsparam(){
        name = "Mars";
        g = 3.711;
        r = 3390000;
        M = 6.39e+23;
        T = 20;
}

void Planet::Jupiterparam(){
        name = "Jupiter";
        g = 24.79;
        r = 69911000;
        M = 1.898e+27;
        T = -234;
}

void Planet::Saturnparam(){
        name = "Saturn";
        g = 10.44;
        r = 58232000;
        M = 5.683e+26;
        T = -178;
}

void Planet::Uranusparam(){
        name = "Uranus";
        g = 8.69;
        r = 25362000;
        M = 8.681e+25;
        T = -216;
}

void Planet::Neptuneparam(){
        name = "Neptune";
        g = 11.15;
        r = 24622000;
        M = 1.024e+26;
        T = -214;
}

void Planet::Xparam(){

        cout << "\nCongratulations! By choosing Planet X you have just inflicted your computer with virus."<<endl;
        cout << "...Just kidding, planet X allows you to type in parameters of any desired planet!"<<endl;
        cout << "Please enter the following parameters: name, gravity, radius, mass and temperature of the planet." <<endl;
        cout << "*NOTE: all of the parameters are approximately restricted to be within the range of Ceres (smallest dwarf planet) and Sun."<<endl;

        //Enter name
        cout << "\nName your planet (name of the planet is limited to 20 characters): ";
        cin.ignore();
        getline(cin,name);
        while (name.size() == 0 || name.size() > 20){
            cout << "\nPlease enter less than 20 characters:   \nName:" <<endl;
            getline(cin,name);
        }

        //Enter gravity
        cout << "\nSun's gravity equals to 274 m/s^2! Please enter values between (1 - 275):" <<endl;
        cout << "Gravity (m/s^2)= ";
        cin >> g;
        while (g < 0.1 || g > 275){

            cout << "Make sure you enter a positive, reasonable number (1 - 275): \ng = ";
            cin >> g;
        }

        //Enter radius
        cout << "\nOut of all dwarf planets, planets, and stars in the Solar system. "<<endl;
        cout << "The one with the smallest radius is dwarf planet Ceres = 455000 m, and with largest is Sun = 695,700,000 m."<<endl;
        cout << "Please enter values between (4.5e+5 - 7.0e+8):" <<endl;
        cout << "Radius (m) = ";
        cin >> r;
        while (r < 450000 || r > 700000000){

            cout << "\nMake sure you enter a positive, reasonable number (4.5e+5 - 7.0e+8): \nr = ";
            cin >> r;
        }

        //Enter mass
        cout << "\nThe one with the smallest mass is dwarf planet Ceres = 9.39e+20 kg, and with largest is Sun = 1.99e+30 kg." <<endl;
        cout << "Please enter values between (9e+20 - 2e+30):" <<endl;
        cout << "Mass (kg) = ";
        cin >> M;
        while (M < 9e+20 || M > 2e+30){
            cout << "\nMake sure you enter a positive, reasonable number (9e+20 - 2e+30): \nM = ";
            cin >> M;
        }
        //Enter average temperature
        cout << "\nThe one with the lowest average temperature is Uranus = -224 C, and with highest is Sun = 5,505 C." <<endl;
        cout << "\nAverage Temperature (C) = ";
        cin >> T;
        while (T < -225 || T > 5600){
            cout << "\nMake sure you enter a positive, reasonable number (-225 - 5600): \nT = ";
            cin >> T;
        }
}

//END OF PLANET PARAMETERES FUNCTIONS------------------------------------------->  CALCULATING FUNCTIONS START
double Planet::surfaceWeight() //calculating weight of an object on the surface of the planet
	{
		double W = g * m;
		return W;
	}

double Planet::orbitalRadius() //calculates orbital radius = distance of satelite to the surface (altitude) + radius of planet
	{
		double R = alt + r;
		return R;
	}

double Planet::gForce() //calculates centripetal force      ||| F = GMm/R^2
	{
		double F = (G*M*m) / pow(orbitalRadius(),2);
		return F;
	}

double Planet::orbitalVel() //calculates orbital velocity      ||| V = sqrt((GM/R)
	{
		V = sqrt((G*M) / orbitalRadius());
		return V;
	}

double Planet::escapeVel() //calculates escape velocity    ||| V = sqrt((2GM/R)
	{
        Vesc = sqrt((2*G*M) / orbitalRadius());
		return Vesc;
	}

double Planet::acceleration() //calculates centripetal acceleration     ||| a = V^2/R
	{
	    a = pow(V,2)/orbitalRadius();
		return a;
	}

double Planet::momentum() //calculates momentum    ||| L = m * sqrt(GMR)
	{
	    L = m * sqrt(G * M * orbitalRadius());
		return L;
	}

double Planet::period() //calculates the period of an object    ||| P = sqrt [(4 * pi^2 * R^3) / (G*M)], pi = 3.14159
	{
	    P = sqrt((4 * pow(3.14159,2) * pow(orbitalRadius(),3)) / (G * M));
		return P;
	}

double Planet::sAxis()//calculates semi-major axis using Kepler's law   ||| P^2 = d^3 ---> d = P^2/3
	{
	    d = pow((P/31536000),0.6666667); //diving by "31536000" to convert from seconds to years ||| 0.66666667 = 2/3
	    return d;
	}

double Planet::aphelion() //calculates longest semi-major axis     ||| A = a(1+e)
	{
	    aph = d*(1+ecc);
		return aph;
	}

double Planet::perihelion() //calculates shortest semi-major axis    ||| P = a(1-e)
	{
        per = d*(1-ecc);
		return per;
	}


//END OF CALCULATING FUNCTIONS------------------------------------------->   Planet Interface function STARTS
void Planet::planetI() {

        //clear prompt
        cout << string(40, '\n');

        //Basic planet info
        cout << "=================================="<<endl;
        cout << "Planet:\t"  << name <<endl;
        cout << "----------------------------------"<<endl;
        cout << "Radius = " << r<<" m "<<endl;
        cout << "Mass = "<<M<<" kg"<<endl;
        cout << "Gravity = "<<g<<" m/s^2"<<endl;
        cout << "Average temperature = "<<T<<" C"<<endl;
        cout << "==================================\n"<<endl;

        //Enter name
        cout << "===================================================================================================================================================" <<endl;
        cout << "*****Please enter the parameters of your satellite/probe*****" <<endl;
        cout << "\nName your satellite (name of the satellite is limited to 20 characters)  \nName:";
        cin.ignore();
        getline(cin,sname);
        while (sname.size() == 0 || sname.size() > 20){
            cout << "\nPlease enter less than 20 characters:" <<endl;
            getline(cin,sname);
        }

        //Enter mass
        cout << "\nCurrently our least massive object in space is m = 259 kg, and most massive m = 419,455 kg. " <<endl;
        cout << "Please enter the mass(kg) of " <<sname<< " (100 kg - 1.0e+6 kg): \nm = ";
        cin >> m;
        while (m < 100 || m > 1e+6){
            cout << "\nMake sure you enter a positive, reasonable number: \nm = ";
            cin >> m;
        }

        //Enter altitude
        cout << "\nCurrently, the lowest altitude satellite in space alt = 242,000 meters, ";
        cout << "and the highest altitude alt = 1,500,000,000";
        cout << "\nPlease enter the altitude(m) of " <<sname<< " (1.0e+5 m - 2.0e+9 m): \nalt = ";
        cin >> alt;
        while (alt < 1e+5 || alt > 2e+9){
            cout << "\nPlease enter a positive, reasonable number: \nalt = ";
            cin >> alt;
        }

        //Enter eccentricity
        cout << "\nEccentricity can vary between 0, for circular orbit, up to 1 for elliptical orbit." <<endl;
        cout << "Please enter the eccentricity of " <<sname<< " (0 - 1):  \necc = ";
        cin >> ecc;

        while (ecc < 0 || ecc > 1){
            cout << "Please enter values between 0 and 1: " <<endl << "ecc = ";
            cin >> ecc;
            }
        if (ecc == 1){
            cout << "\nIf eccentricity is 1 it becomes parabolic, if greater than 1 becomes hyperbolic!" <<endl;
            cout << "Try again from 0 to 1:" <<endl << "ecc = ";
            cin >> ecc;
            }

        cout << "===================================================================================================================================================" <<endl;
        cout << "Press Enter to do the calculations for " <<sname<< " orbiting around " <<name<<"." <<endl;
        cin.get();
        cin.ignore();

        //surfaceWeight()
        cout << "\n===================================================================================================================================================" <<endl;
        if (ecc == 0){
            cout << sname<< " has a perfectly circular orbit!" <<endl;
            }

        cout << "Mass of " <<sname<< " is " << m << " kg times " << name << "'s gravity " << g << ". ";
        cout << "We can calculate gravitational weight if " <<sname<< " lands on " << name << "'s surface:" <<endl;
        cout << "W = g*m  \nW = " <<surfaceWeight() << " N" <<endl;

        //orbitalRadius()
        cout << "\nOrbital radius (R) of " <<sname<< " is a sum of radius of " << name << " " << r << " m and altitude of the " <<sname<< " " << alt;
        cout <<  " m. Which makes R: \nR = r+alt \nR = " <<orbitalRadius() << " m" << endl;

        //gForce()
        cout <<"\n" <<name<< " attracts " <<sname<< " with gravitational force. Equation for F:" <<endl;
        cout << "F = GMm/R^2 \nF = " <<gForce() << " N"<<endl;
        cout << "Where M is the mass of " << name << ", R orbital radius of " <<sname<< ", G is universal constant";
        cout << " 6.673e-11 Nm^2/kg^2 and m mass of " <<sname<< "."<< endl;

        //orbitalVel()
        cout << "\n" <<sname<< " is exerting centripetal force(Fc) on the " << name << " which is equal to the gravitation force(Fg) that " << name << " is exerting on " <<sname<< "." << endl;
        cout << "Setting Fc equal to Fg, we can calculate velocity(V) of the " <<sname<< " using Newton's laws.";
        cout <<  " Solving for V equation goes: \nV = sqrt((GM)/R) \nV = " << orbitalVel() << " m/s" <<endl;

        //escapeVel()
        cout << "\nThe escape velocity is the minimum velocity required to overcome the pull of gravity. ";
        cout << "Equation for Vesc: \nVesc = sqrt((2GM)/R) \nVesc = " << escapeVel() << " m/s" <<endl;

        //acceleration()
        cout << "\nCentripetal acceleration is the rate of change in the " <<sname<< "'s velocity while orbiting. ";
        cout << "Equation for a: \na = V^2/R \na = " << acceleration() << " m/s^2" <<endl;

        //momentum()
        cout << "\nOrbital Angular momentum is the rotational equivalent of linear momentum. ";
        cout << "Equation for L: \nL = m*sqrt(GMR) \nL = " <<momentum()<< " kgm^2/s" <<endl;

        //period()
        cout << "\nNext, we can calculate period, which is how long it takes " <<sname<< " to orbit around the " << name << " one time.";
        cout <<  " Equation for period: \nP = sqrt[(4 * pi^2 * R^3) / (G*M)]   \nP = " <<period()<< " s = " <<period()/60<< " min";
        cout << " = " <<period()/3600<< " h"<<endl;

        //sAxis()
        cout << "\nOnce we find period, we can calculate semi-major axis using Kepler's 3rd law." <<endl;
        cout << "Equation for semi-major axis: \nP^2 = d^3 \nd = " <<sAxis()<< " AU --> " <<sAxis()*1.496e+11<< " m" <<endl; //*1.496e+11 to convert to meters

        //Aphelion & Perihelion
        cout << "\nSemi-major axis and eccentricity allow us to calculate aphelion and perihelion, ";
        cout << "furthest and closest distance of " <<sname<< " from " <<name<< ":" <<endl;
        cout << "aph = d*(1+ecc)    \naph = " << aphelion() << " AU --> " << aphelion()*1.496e+11<< " m" <<endl;
        cout << "\nper = d*(1-ecc)    \nper = " << perihelion() << " AU --> " << perihelion()*1.496e+11<< " m" <<endl;

        if (aph == per){
            cout << "Aphelion and perihelion are equal because eccentricity is 0 (circular orbit)."<<endl;
        }
        cout << "===================================================================================================================================================" <<endl;
	}


//END OF Planet Interface function-------------------------------------------------------->   Int main STARTS
int main()
{

//switch variables and CHARs for loops
	string planetn;
	int value = 0;
	int counter = 0;
	char again = 'y';
	char compare = 'y';
	cout << setprecision(2) << scientific << showpoint;

	cout << "Greetings! Welcome to 'Satellite's Motion' program!" << endl;
	cout << "The program is designed to calculate: \n-Weight    \n-Orbital radius   \n-Orbital velocity  \n-Escape velocity";
	cout << "\n-Acceleration    \n-Period   \n-Semi-major axis \n-Aphelion   \n-Perihelion,\njust by entering mass, altitude and eccentricity of the satellite/probe." <<endl;
	cout << "Each satellite/probe on different planet will have different values because of the unique conditions of each planet." <<endl;

	//while for whole program to repeat again if again = 'y' or compare = 'n'
	while (again == 'y' || again == 'Y' || compare == 'n') {

    compare = 'y'; //compare resets to allow while loop again
    counter =0;//when it starts all over counter resets
    value = 0; //value resets to 0 for planet choice
    cin.clear(); //input reset

		cout << "\nPlease enter the number of the planet from the list: \n\n 1. Mercury\n 2. Venus\n 3. Earth\n 4. Mars\n";
		cout << " 5. Jupiter\n 6. Saturn\n 7. Uranus\n 8. Neptune\n 9. Planet X \n" << endl;
		cout << "Enter: ";
		cin >> value;
		cout << endl;

        //giving planets a number value
		switch (value)
		{
		case 1: planetn = "Mercury";  break;
		case 2: planetn = "Venus";  break;
		case 3: planetn = "Earth";  break;
		case 4: planetn = "Mars";  break;
		case 5: planetn = "Jupiter";  break;
		case 6: planetn = "Saturn";  break;
		case 7: planetn = "Uranus"; break;
		case 8: planetn = "Neptune";  break;
		case 9: planetn = "Planet X";  break;
		default: planetn = "N/A";

            //condition for non existing planets
			while (value < 1 || value >9)
			{
				cout << "The planet that does not exist, please try again: " << endl;
				value = 0;
				cin >> value;
			}
		}

//while for comparing
while (compare == 'y' || compare == 'Y') {

counter ++;//when chosen to compare counter increments

Planet OrgPlanet;   //declaring original planet object, the first planet user chooses when counter = 1.
Planet CompPlanet;  //declaring the comparison object, the second planet user chooses when counter = 2.

//MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY MERCURY
		if (value == 1) {

            if (counter == 1){
                OrgPlanet.Mercuryparam(); //planet's parameters
                OrgPlanet.planetI(); //calling planet's interface function that calls other functions for all the calculations
            }
            if (counter == 2){
                CompPlanet.Mercuryparam();
                CompPlanet.planetI(); //calling planet's interface function for comparing planet
            }
		}

//VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS VENUS
		if (value == 2) {

            if (counter == 1){
                OrgPlanet.Venusparam();
                OrgPlanet.planetI();
            }
            if (counter == 2){
                CompPlanet.Venusparam();
                CompPlanet.planetI();
            }
		}

//EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH EARTH
		if (value == 3) {

            if (counter == 1){
                OrgPlanet.Earthparam();
                OrgPlanet.planetI();
            }
            if (counter == 2){
                CompPlanet.Earthparam();
                CompPlanet.planetI();
            }
		}

//MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS MARS
		if (value == 4) {

			if (counter == 1){
                OrgPlanet.Marsparam();
                OrgPlanet.planetI();
			}
			if (counter == 2){
                CompPlanet.Marsparam();
                CompPlanet.planetI();
			}
		}

//JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER JUPITER
		if (value == 5) {

			if (counter == 1){
                OrgPlanet.Jupiterparam();
                OrgPlanet.planetI();
			}
			if (counter == 2){
                CompPlanet.Jupiterparam();
                CompPlanet.planetI();
			}
		}

//SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN SATURN
		if (value == 6) {

			if (counter == 1){
                OrgPlanet.Saturnparam();
                OrgPlanet.planetI();
			}
			if (counter == 2){
                CompPlanet.Saturnparam();
                CompPlanet.planetI();
			}
		}

//URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS URANUS
		if (value == 7) {

			if (counter == 1){
            OrgPlanet.Uranusparam();
			OrgPlanet.planetI();
			}
			if (counter == 2){
            CompPlanet.Uranusparam();
			CompPlanet.planetI();
			}
		}

//NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE NEPTUNE
		if (value == 8) {

            if (counter == 1){
            OrgPlanet.Neptuneparam();
			OrgPlanet.planetI();
            }
			if (counter == 2){
            CompPlanet.Neptuneparam();
			CompPlanet.planetI();
			}
		}

//PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X PLANET X
		if (value == 9) {

            if (counter == 1){
            OrgPlanet.Xparam();
			OrgPlanet.planetI();
            }
			if (counter == 2){
            CompPlanet.Xparam();
			CompPlanet.planetI();
			}
		}
//END OF IF STATEMENTS ||| END OF IF STATEMENTS ||| END OF IF STATEMENTS ||| END OF IF STATEMENTS |||

//Asking the user to compare results of one planet with results of another
if (counter <=1 ){

    value = 0;
    cout << string(2, '\n');

    cout << "You can compare results to some other planet, you can choose the same planet." <<endl;
    cout << "Choosing 'n' will allow you to start over or quit the program." <<endl;
    cout << "Would you like to compare satellites? (y/n)" <<endl;
    cin >> compare;

        if (compare == 'y' || compare == 'Y'){
            cout << string(40, '\n');
            cout << "What planet would you like to compare it to, choose the number from the list:" << endl;
            cout << "\n 1. Mercury\n 2. Venus\n 3. Earth\n 4. Mars\n 5. Jupiter\n 6. Saturn\n 7. Uranus\n 8. Neptune\n 9. Planet X\n" << endl;
            cout << "Enter: " <<endl;
            cin >> value;

            //condition for non existing planets
            while (value < 1 || value >9)
            {
                cout << "The planet that does not exist, please try again: " << endl;
                value = 0;
                cin >> value;
            }
        }
    }

//when counter bigger than one, means two planets are typed in and table is prompted
if ( counter == 2){

        cout << "\nPress Enter to see the table summary."<<endl;
        cin.get();
        cout << string(3, '\n');
        cout << setfill (' ') << setw (44) << "SUMMARY"<<endl;

//     ||| TABLE ||| ASCII characters for table's outside borders (char)178 and for inside borders (char)176
        for (int i = 0; i <= 76; i++){
            cout << (char)178;
        }

        cout << "\n\t" <<(char)176<< "FIRST PLANET" <<(char)176<< "\t\t\t" <<(char)178 << "\t" <<(char)176<< "SECOND PLANET" <<(char)176<<endl;

        for (int i = 0; i <= 76; i++){
            cout << (char)176;
        }

        //initial variables
        cout << "\ng = \t" <<OrgPlanet.g << " m/s^2\t\t\t" << (char)178 << "g = \t" <<CompPlanet.g << " m/s^2\t" <<endl;
        cout << "m = \t" <<OrgPlanet.m << " kg\t\t\t" << (char)178 << "m = \t" <<CompPlanet.m << " kg\t" <<endl;
        cout << "alt = \t" <<OrgPlanet.alt << " m\t\t\t" << (char)178 << "alt =  " <<CompPlanet.alt << " m\t" <<endl;
        cout << "M = \t" <<OrgPlanet.M << " kg\t\t\t" << (char)178 << "M =\t" <<CompPlanet.M << " kg\t" <<endl;
        cout << "r = \t" <<OrgPlanet.r << " m\t\t\t" << (char)178 << "r =\t" <<CompPlanet.r << " m\t" <<endl;

        for (int i = 0; i <= 76; i++){
            cout << (char)176;
        }

        //calculated variables
        cout << "\nW = \t" <<OrgPlanet.surfaceWeight() << " N\t\t\t" << (char)178 << "W = \t" <<CompPlanet.surfaceWeight() << " N\t" <<endl;
        cout << "R = \t" <<OrgPlanet.orbitalRadius() << " m\t\t\t" << (char)178 << "R = \t" << CompPlanet.orbitalRadius() << " m\t" <<endl;
        cout << "F = \t" <<OrgPlanet.F << " N\t\t\t" << ( char)178 << "F = \t" <<CompPlanet.F << " N\t" <<endl;
        cout << "V = \t" <<OrgPlanet.V << " m/s\t\t\t" << ( char)178 << "V = \t" <<CompPlanet.V << " m/s\t" <<endl;
        cout << "Vesc =  " <<OrgPlanet.Vesc << " m/s\t\t\t" << (char)178 << "Vesc = " <<CompPlanet.Vesc << " m/s\t" <<endl;
        cout << "a = \t" <<OrgPlanet.a << " m/s^2\t\t\t" << (char)178 << "a = \t" <<CompPlanet.a << " m/s^2\t" <<endl;
        cout << "L = \t" <<OrgPlanet.L << " kgm^2/s\t\t" << (char)178 << "L = \t" <<CompPlanet.L << " kgm^2/s\t" <<endl;
        cout << "P = \t" << OrgPlanet.period()/3600<< " h\t\t\t" << (char)178 << "P = \t" <<CompPlanet.period()/3600<< " h\t" <<endl;
        cout << "d = \t" << OrgPlanet.d*1.496e+11 <<" m\t\t\t" << (char)178 << "d = \t" << CompPlanet.d*1.496e+11<< " m\t" <<endl;
        cout << "aph = \t" << OrgPlanet.aph*1.496e+11<< " m\t\t\t" << (char)178 << "aph = \t" << CompPlanet.aph*1.496e+11<< " m\t" <<endl;
        cout << "per = \t" << OrgPlanet.per*1.496e+11<< " m\t\t\t" << (char)178 << "per = \t" << CompPlanet.per*1.496e+11<< " m\t" <<endl;

        for (int i = 0; i <= 76; i++){
            cout << (char)178;
        }
//      ||| END OF TABLE |||

        compare = 0; //set to zero to exit the comparison loop
        }
    }//END OF WHILE COMPARISON LOOP


//Asking the user for fresh start if after comparing two planets
    cout << string(4, '\n');
    cout << "To go to the starting list type 'y', to quit the program type 'q' and press Enter." << endl;
    cin >> again;

    if (again == 'q' || again == 'Q'){
        abort();
    }

    cout << string(40, '\n');

}//END OF WHILE AGAIN LOOP

	system("pause");
	return 0;
}

