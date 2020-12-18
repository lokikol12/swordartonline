
mob
	verb
/*
I've redone the html. Try to stick to that layout for easier reading and editing.
Best would be to use an online html editor when you edit stuff to see what it looks like.
One of the ones I use for quick stuff is: https://htmlcodeeditor.com/
Just delete the stuff that it generates when you load the page and copy paste whatever you have below this.

Notes:
<h#></h#> where # is a number going from large(1) to small(10) creates a title with some space between that and the text below.
<br /> is the same as <br>, but it's proper.
*/




		Guide()
			set category = "Other"
			switch(input("Which guide do you want to see?", text) in list ("Update Log","Item Drops","Donations"))
				if("Update Log")
					var/helptext = {"
			<html>
				<body style="background-color:black; color:white;">
					<h3><b>Update Info</b></h3>
					12/18/2020 added observe verb for admin...</br>
					12/18/2020 added, adding custom overlays.</br>
					12/18/2020 added send file verb.</br>
					12/18/2020 added afk toggle.</br>
					12/18/2020 added a server tab for the world event info(less lag on stats tab.</br>
					12/18/2020 added auto tounrys with random rewards and level for all who join.</br>
					12/18/2020 made sense on sense people, increase range to 25.</br>
					10/9/2020 Made guild quest pay out 2x.</br>
					10/8/2020 Added event tab to stats tab for stat point event(atm most effective is with selftrain).</br>
					10/8/2020 Added stat event to the random proc.</br>
					10/8/2020 Added a new event, a stat gain boost event.</br>
					10/8/2020 Added extra exp for people using self train when 2x exp is on.</br>
					10/8/2020 Fixed going inside hospitals as safe zones.</br>
					10/8/2020 Attempted to fix the party an guid exp share showing( it gains wasnt showing tho)</br>
					10/8/2020 Fixed the bug with the floor 10 wings.</br>
					10/8/2020 Removed everything from commands tab to other tab.</br>
					10/8/2020 Added send cor verb to other tab.</br>
					10/8/2020 Fixed hunt tracker for hades kill counts.</br>
					10/6/2020 Increased the vaule of having resistance stat by 30%.</br>
					10/6/2020 Increased the vaule of having defense stat by 30%.</br>
					10/6/2020 Updated Floor drop info tab.</br>
					10/6/2020 Lowered all donations prices.</br>
					10/6/2020 made a new sword for floor 16 which should be discovered this week.</br>
					10/6/2020 Attack has a chance to knockback whoever is hit.</br>
					10/6/2020 Added 2 new drops magic blade dual swords to floor 13-15 as drops.</br>
					10/6/2020 Parties and guides only share 50% exp tho.</br>
					10/6/2020 Parties and guilds share exp on all maps.</br>
					10/4/2020 Fixed the negtive muti on death sometimes.</br>
					10/4/2020 Increased payouts for guild quest.</br>
					10/4/2020 Seperated ranks to 2 npcs since people like to spam go the same race.</br>
					10/4/2020 Fixed Kuroi spam gains.</br>
					10/4/2020 Added join raid to the top bar.</br>
					10/4/2020 Fixed all the verbs at the top of the bar, edited some lag fixes.</br>
					8/26/2020 Added auto events, Raid, Dbl exp, Dbl Cor, Discord link.</br>
					8/26/2020 Added double click to view mobs and players stats.</br>
					8/26/2020 Fix invis wall outside hospital.</br>
					8/26/2020 Added a update log.</br>
				</body>
			</html>
			"}
					winshow(usr,"browser",1)
					usr << browse(helptext)
				if("Item Drops")
					var/helptext = {"
			<html>
				<body style="background-color:black; color:white;">
					Floor 1 Sword, Armor, Staff.<br />
					Floor 2 Sword, Armor. <br />
					Floor 3 Armor, staff. <br />
					Floor 4 Sword,Armor. <br />
					Floor 5 Truth orbs. <br />
					Floor 6 Coat of midnight.<br />
					Floor 7 Staff of Light.<br />
					Floor 8 Excalibur.<br />
					Floor 9 Unity Vox.<br />
					Floor 10 Blood Oath Armor, Archmage robe.<br />
					Floor 11 Staff of time, Excalibur.<br />
					Floor 12 Fire orbs, Neptune Armor, Demonic Sword Gram.<br />
					Floor 13 Magic blade</br>
					Floor 14 & 15 Magic Blade of Witchcraft.</br>
					Floor 16 ???.</br>
				</body>
			</html>
			"}
					winshow(usr,"browser",1)
					usr << browse(helptext)


				if("Donations")
					var/helptext = {"
			<html>
				<body style="background-color:black; color:white;">
				-1 Bill Cor  = 1$</br>
				-Sub = 3$ wipe {10$LifeTime} </br>
				-Custom family 20$$ Family house + 2 Passives.</br>
				-Custom Weapons/Armor/Misc = 10$ One / 15$ Two / 20$ Three.  ( Muti scale to floor 15 gear)</br>
				-Have your own Sword art online idea! Get with me on discord!</br>
				-Alexbarclay777@gmail.com @ paypal</br>
				</body>
			</html>
			"}
					winshow(usr,"browser",1)
					usr << browse(helptext)





























