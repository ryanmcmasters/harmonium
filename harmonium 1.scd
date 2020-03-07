/*

HARMONIUM #1
.for(Lou Harrison)

.by(James Tenney)
.prog(R.McMASTERS)


to perform:

language -> evaluate file.

type the numbers on the screen, allowing each sound to nearly complete before choosing another number.

*/

s.boot;
s.waitForBoot{

	//the synth
	SynthDef(\otone, {
		arg keyfreq,amp=0.2,dur=7.0;
		var sin, env;
		env = XLine.kr(amp,amp,dur, mul:SinOsc.kr(0.5/dur), doneAction:1);
		sin = SinOsc.ar(keyfreq.midicps, mul:env);
		Out.ar([0,1],sin);
	}).load(s);


	//the score

	//section 1

	~m01 = [0,     0,     69, 0, 0, 0];
	~m02 = [0,     76.02, 69, 0, 0, 0];
	~m03 = [84.86, 76.02, 69, 0, 0, 0];
	~m04 = [83.69, 76.02, 69, 0, 0, 0];
	~m05 = [83.69, 77.86, 69, 0, 0, 0];

	//section 2

	~m06 = [83.69, 77.86, 69,    62,    0,  0];
	~m07 = [83.69, 76.69, 69,    62,    0,  0];
	~m08 = [83.69, 76.69, 70.86, 62,    0,  0];
	~m09 = [84.51, 76.69, 70.86, 62,    0,  0];
	~m10 = [84.51, 76.69, 70.86, 62,    55, 0];
	~m11 = [84.51, 76.69, 69.69, 62,    55, 0];
	~m12 = [84.51, 76.69, 69.69, 63.86, 55, 0];
	~m13 = [85.05, 76.69, 69.69, 63.86, 55, 0];
	~m14 = [85.05, 77.51, 69.69, 63.86, 55, 0];

	//section 3

	~m15 = [85.05, 77.51, 69.69, 63.86, 55, 48];
	~m16 = [84,    77.51, 69.69, 63.86, 55, 48];

	//section 4

	~m17 = [84, 77.51, 69.69, 63.86, 53, 0];
	~m18 = [84, 78.05, 69.69, 63.86, 53, 0];
	~m19 = [84, 78.05, 69.69, 62.69, 53, 0];
	~m20 = [84, 78.05, 68.86, 62.69, 53, 0];

	//section 5

	~m21 = [84,    78.05, 68.86, 59, 0, 0];
	~m22 = [84,    74.86, 68.86, 59, 0, 0];
	~m23 = [84,    74.86, 66.02, 59, 0, 0];
	~m24 = [80.69, 74.86, 66.02, 59, 0, 0];

	//section 6

	~m25 = [80.69, 74.86, 64, 0, 0, 0];
	~m26 = [80.69, 73.69, 64, 0, 0, 0];
	~m27 = [79.86, 73.69, 64, 0, 0, 0];

	// end
	~m28 = [0, 0, 0, 0, 0, 0];

	//some variables
	~t = 9;     //duration of piece, in minutes
	~shift = 7; //shift of pitches above or below original key, in midi notes


	//a window
	~window = Window.new("HARMONIUM #1", Rect(0, 0, Window.availableBounds.width, Window.availableBounds.height))
	.background_(Color.black)
	.front
	.alwaysOnTop_(true)
	.view.keyDownAction = {

		arg view, char, modifiers, unicode;
		[char, unicode].postln;
		~textbox.background_(Color.new255(0,255,255,(255-((54-unicode)*42))));

		~x = Synth(\otone, [\keyfreq,(~m[(unicode-49)]+~shift),\dur,rrand(4,12)]);

	};

	//some textboxes
	~textbox = StaticText(~window, Rect(0,0,Window.availableBounds.width,Window.availableBounds.height))
	.align_(\center)
	.string_("press play together.")
	.stringColor_(Color.grey)
	.background_(Color.clear)
	.font_(Font(size:100));

	~textbox2 = StaticText(~window, Rect(0,0,Window.availableBounds.width,200))
	.align_(\center)
	.string_("HARMONIUM #1
James TENNEY")
	.stringColor_(Color.grey)
	.background_(Color.clear)
	.font_(Font(size:50));

	//a button
	~button1 = Button(~window, Rect((Window.availableBounds.width/2-175), 200, 350, 100))
	.states_([
		["play", Color.grey, Color.white],
		["stop", Color.grey, Color.clear],
		["close"]
	])
	.font_(Font(size:72))
	.action_({
		arg obj;
		if(
			obj.value ==1,
			{

				//section 1

				//1
				AppClock.sched(0,
					Routine({
						~textbox.string_("3");
						~m = ~m01});
				);

				//2
				AppClock.sched(~t*2,
					Routine({
						~textbox.string_("2 3");
						~m = ~m02});
				);

				//3
				AppClock.sched(~t*4,
					Routine({
						~textbox.string_("1 2 3");
						~m = ~m03});
				);

				//4
				AppClock.sched(~t*6,
					Routine({
						~m = ~m04});
				);

				//5
				AppClock.sched(~t*8,
					Routine({
						~m = ~m05});
				);

				//section 2

				//6
				AppClock.sched(~t*10,
					Routine({
						~textbox.string_("1 2 3 4");
						~m = ~m06});
				);

				//7
				AppClock.sched(~t*11.11,
					Routine({
						~m = ~m07});
				);

				//8
				AppClock.sched(~t*12.22,
					Routine({
						~m = ~m08});
				);

				//9
				AppClock.sched(~t*13.33,
					Routine({
						~m = ~m09});
				);

				//10
				AppClock.sched(~t*14.44,
					Routine({
						~textbox.string_("1 2 3 4 5");
						~m = ~m10});
				);

				//11
				AppClock.sched(~t*15.55,
					Routine({
						~m = ~m11});
				);

				//12
				AppClock.sched(~t*16.66,
					Routine({
						~m = ~m12});
				);

				//13
				AppClock.sched(~t*17.77,
					Routine({
						~m = ~m13});
				);

				//14
				AppClock.sched(~t*18.88,
					Routine({
						~m = ~m14});
				);

				//section 3

				//15
				AppClock.sched(~t*20,
					Routine({
						~textbox.string_("1 2 3 4 5 6");
						~m = ~m15});
				);

				//16
				AppClock.sched(~t*25,
					Routine({
						~m = ~m16});
				);

				//section 4

				//17
				AppClock.sched(~t*30,
					Routine({
						~textbox.string_("1 2 3 4 5");
						~m = ~m17});
				);

				//18
				AppClock.sched(~t*32.6,
					Routine({
						~m = ~m18});
				);

				//19
				AppClock.sched(~t*35,
					Routine({
						~m = ~m19});
				);

				//20
				AppClock.sched(~t*37.5,
					Routine({
						~m = ~m20});
				);

				//section 5

				//21
				AppClock.sched(~t*40,
					Routine({
						~textbox.string_("1 2 3 4");
						~m = ~m21});
				);

				//22
				AppClock.sched(~t*42.5,
					Routine({
						~m = ~m22});
				);

				//23
				AppClock.sched(~t*45,
					Routine({
						~m = ~m23});
				);

				//24
				AppClock.sched(~t*47.5,
					Routine({
						~m = ~m24});
				);

				//section 6

				//25
				AppClock.sched(~t*50,
					Routine({
						~textbox.string_("1 2 3");
						~m = ~m25});
				);

				//26
				AppClock.sched(~t*53.33,
					Routine({
						~m = ~m26});
				);

				//27
				AppClock.sched(~t*56.66,
					Routine({
						~m = ~m27});
				);

				//28
				AppClock.sched(~t*60,
					Routine({
					~textbox.string_(" ");
						~m = ~m28;
						~textbox.background_(Color.black)});
				);


			};
		);

		if(
			obj.value ==2,
			{Window.closeAll});

	});
}