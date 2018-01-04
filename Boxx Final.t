%Author: Daniel Kantor, Jonny Hovich
%File Name: BOXX.t
%Project Name: BOXX
%Creation Date: May. 16, 2014
%Modified Date: June. 11, 2014
%Description: This game will have 15 levels to complete. The objective in each level is for the red square (player) to get to the green area
%             of the map without hitting any obstacles. If hit by an obstacle, death count goes up. The game will include a Level Select, Help,
%             & Highscore screen which creates a more intuitive game experience for the user. The user can also pause the game anytime throught
%             gameplay. The user moves around using the arrow keys, and also uses the mouse to access many other features of the game. Music/Sound
%             effects are played during gameplay as well. You can click N to skip the level.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%           SCREEN OPTIONS AND RECORD           %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Setting screen options such as graphics, button bar, title, and more.
View.Set ("graphics:900;633")
View.Set ("nobuttonbar")
View.Set ("offscreenonly")
View.Set ("title: BOXX")
View.Set ("noecho")
View.Set ("nocursor")

%needed to save spawnPoints of the squares, this is used in the SetSpawnForPlayer proc.
type Point :
    record
	x : int %save the squareX
	y : int %save the squareY
    end record

type highscore :
    record
	x : int %save the score location for X
	y : int %save the score location for Y
    end record

type Obstacle :
    record
	point : Point
	color : int
	size : int
	numpoints : int
	path : array 1 .. 360 of Point
	nextpoint : int
	speed : int
    end record


%LEVEL 1 OBSTACLES
var lvl1Obstacles : array 1 .. 5 of Obstacle
%Level 1 - Obstacle #1
lvl1Obstacles (1).point.x := 267
lvl1Obstacles (1).point.y := 250
lvl1Obstacles (1).color := blue
lvl1Obstacles (1).size := 12
lvl1Obstacles (1).numpoints := 2
lvl1Obstacles (1).path (1).x := 267
lvl1Obstacles (1).path (1).y := 310
lvl1Obstacles (1).path (2).x := 267
lvl1Obstacles (1).path (2).y := 100
lvl1Obstacles (1).nextpoint := 2
lvl1Obstacles (1).speed := 8

%Level 1 - Obstacle #2
lvl1Obstacles (2).point.x := 348
lvl1Obstacles (2).point.y := 250
lvl1Obstacles (2).color := blue
lvl1Obstacles (2).size := 12
lvl1Obstacles (2).numpoints := 2
lvl1Obstacles (2).path (1).x := 348
lvl1Obstacles (2).path (1).y := 310
lvl1Obstacles (2).path (2).x := 348
lvl1Obstacles (2).path (2).y := 100
lvl1Obstacles (2).nextpoint := 2
lvl1Obstacles (2).speed := 8

%Level 1 - Obstacle #3
lvl1Obstacles (3).point.x := 428
lvl1Obstacles (3).point.y := 250
lvl1Obstacles (3).color := blue
lvl1Obstacles (3).size := 12
lvl1Obstacles (3).numpoints := 2
lvl1Obstacles (3).path (1).x := 428
lvl1Obstacles (3).path (1).y := 310
lvl1Obstacles (3).path (2).x := 428
lvl1Obstacles (3).path (2).y := 100
lvl1Obstacles (3).nextpoint := 2
lvl1Obstacles (3).speed := 8

%Level 1 - Obstacle #4
lvl1Obstacles (4).point.x := 508
lvl1Obstacles (4).point.y := 250
lvl1Obstacles (4).color := blue
lvl1Obstacles (4).size := 12
lvl1Obstacles (4).numpoints := 2
lvl1Obstacles (4).path (1).x := 508
lvl1Obstacles (4).path (1).y := 310
lvl1Obstacles (4).path (2).x := 508
lvl1Obstacles (4).path (2).y := 100
lvl1Obstacles (4).nextpoint := 2
lvl1Obstacles (4).speed := 8

%Level 1 - Obstacle #5
lvl1Obstacles (5).point.x := 588
lvl1Obstacles (5).point.y := 250
lvl1Obstacles (5).color := blue
lvl1Obstacles (5).size := 12
lvl1Obstacles (5).numpoints := 2
lvl1Obstacles (5).path (1).x := 588
lvl1Obstacles (5).path (1).y := 310
lvl1Obstacles (5).path (2).x := 588
lvl1Obstacles (5).path (2).y := 100
lvl1Obstacles (5).nextpoint := 2
lvl1Obstacles (5).speed := 8



%LEVEL 2 OBSTACLES
var lvl2Obstacles : array 1 .. 7 of Obstacle
%Level 2 - Obstacle #1
lvl2Obstacles (1).point.x := 289
lvl2Obstacles (1).point.y := 365
lvl2Obstacles (1).color := blue
lvl2Obstacles (1).size := 12
lvl2Obstacles (1).numpoints := 2
lvl2Obstacles (1).path (1).x := 289
lvl2Obstacles (1).path (1).y := 365
lvl2Obstacles (1).path (2).x := 289
lvl2Obstacles (1).path (2).y := 120
lvl2Obstacles (1).nextpoint := 2
lvl2Obstacles (1).speed := 8

%Level 2 - Obstacle #2
lvl2Obstacles (2).point.x := 330
lvl2Obstacles (2).point.y := 120
lvl2Obstacles (2).color := blue
lvl2Obstacles (2).size := 12
lvl2Obstacles (2).numpoints := 2
lvl2Obstacles (2).path (1).x := 330
lvl2Obstacles (2).path (1).y := 120
lvl2Obstacles (2).path (2).x := 330
lvl2Obstacles (2).path (2).y := 365
lvl2Obstacles (2).nextpoint := 2
lvl2Obstacles (2).speed := 8

%Level 2 - Obstacle #3
lvl2Obstacles (3).point.x := 410
lvl2Obstacles (3).point.y := 365
lvl2Obstacles (3).color := blue
lvl2Obstacles (3).size := 12
lvl2Obstacles (3).numpoints := 2
lvl2Obstacles (3).path (1).x := 410
lvl2Obstacles (3).path (1).y := 365
lvl2Obstacles (3).path (2).x := 410
lvl2Obstacles (3).path (2).y := 120
lvl2Obstacles (3).nextpoint := 2
lvl2Obstacles (3).speed := 8

%Level 2 - Obstacle #4
lvl2Obstacles (4).point.x := 450
lvl2Obstacles (4).point.y := 120
lvl2Obstacles (4).color := blue
lvl2Obstacles (4).size := 12
lvl2Obstacles (4).numpoints := 2
lvl2Obstacles (4).path (1).x := 450
lvl2Obstacles (4).path (1).y := 120
lvl2Obstacles (4).path (2).x := 450
lvl2Obstacles (4).path (2).y := 365
lvl2Obstacles (4).nextpoint := 2
lvl2Obstacles (4).speed := 8

%Level 2 - Obstacle #5
lvl2Obstacles (5).point.x := 530
lvl2Obstacles (5).point.y := 365
lvl2Obstacles (5).color := blue
lvl2Obstacles (5).size := 12
lvl2Obstacles (5).numpoints := 2
lvl2Obstacles (5).path (1).x := 530
lvl2Obstacles (5).path (1).y := 365
lvl2Obstacles (5).path (2).x := 530
lvl2Obstacles (5).path (2).y := 120
lvl2Obstacles (5).nextpoint := 2
lvl2Obstacles (5).speed := 8

%Level 2 - Obstacle #6
lvl2Obstacles (6).point.x := 570
lvl2Obstacles (6).point.y := 120
lvl2Obstacles (6).color := blue
lvl2Obstacles (6).size := 12
lvl2Obstacles (6).numpoints := 2
lvl2Obstacles (6).path (1).x := 570
lvl2Obstacles (6).path (1).y := 120
lvl2Obstacles (6).path (2).x := 570
lvl2Obstacles (6).path (2).y := 365
lvl2Obstacles (6).nextpoint := 2
lvl2Obstacles (6).speed := 8

%Level 2 - Obstacle #7
lvl2Obstacles (7).point.x := 650
lvl2Obstacles (7).point.y := 325
lvl2Obstacles (7).color := blue
lvl2Obstacles (7).size := 12
lvl2Obstacles (7).numpoints := 4
lvl2Obstacles (7).path (1).x := 650
lvl2Obstacles (7).path (1).y := 325
lvl2Obstacles (7).path (2).x := 650
lvl2Obstacles (7).path (2).y := 202
lvl2Obstacles (7).path (3).x := 610
lvl2Obstacles (7).path (3).y := 202
lvl2Obstacles (7).path (4).x := 610
lvl2Obstacles (7).path (4).y := 170
lvl2Obstacles (7).nextpoint := 1
lvl2Obstacles (7).speed := 12



%LEVEL 3 OBSTACLES
var lvl3Obstacles : array 1 .. 10 of Obstacle
%Level 3 - Obstacle #1
lvl3Obstacles (1).point.x := 389
lvl3Obstacles (1).point.y := 328
lvl3Obstacles (1).color := blue
lvl3Obstacles (1).size := 12
lvl3Obstacles (1).numpoints := 4
lvl3Obstacles (1).path (1).x := 389
lvl3Obstacles (1).path (1).y := 328
lvl3Obstacles (1).path (2).x := 510
lvl3Obstacles (1).path (2).y := 326
lvl3Obstacles (1).path (3).x := 510
lvl3Obstacles (1).path (3).y := 204
lvl3Obstacles (1).path (4).x := 389
lvl3Obstacles (1).path (4).y := 204
lvl3Obstacles (1).nextpoint := 2
lvl3Obstacles (1).speed := 6

%Level 3 - Obstacle #2
lvl3Obstacles (2).point.x := 429
lvl3Obstacles (2).point.y := 328
lvl3Obstacles (2).color := blue
lvl3Obstacles (2).size := 12
lvl3Obstacles (2).numpoints := 4
lvl3Obstacles (2).path (1).x := 389
lvl3Obstacles (2).path (1).y := 328
lvl3Obstacles (2).path (2).x := 510
lvl3Obstacles (2).path (2).y := 326
lvl3Obstacles (2).path (3).x := 510
lvl3Obstacles (2).path (3).y := 204
lvl3Obstacles (2).path (4).x := 389
lvl3Obstacles (2).path (4).y := 204
lvl3Obstacles (2).nextpoint := 2
lvl3Obstacles (2).speed := 6

%Level 3 - Obstacle #3
lvl3Obstacles (3).point.x := 466
lvl3Obstacles (3).point.y := 328
lvl3Obstacles (3).color := blue
lvl3Obstacles (3).size := 12
lvl3Obstacles (3).numpoints := 4
lvl3Obstacles (3).path (1).x := 389
lvl3Obstacles (3).path (1).y := 328
lvl3Obstacles (3).path (2).x := 510
lvl3Obstacles (3).path (2).y := 326
lvl3Obstacles (3).path (3).x := 510
lvl3Obstacles (3).path (3).y := 204
lvl3Obstacles (3).path (4).x := 389
lvl3Obstacles (3).path (4).y := 204
lvl3Obstacles (3).nextpoint := 2
lvl3Obstacles (3).speed := 6

%Level 3 - Obstacle #4
lvl3Obstacles (4).point.x := 509
lvl3Obstacles (4).point.y := 328
lvl3Obstacles (4).color := blue
lvl3Obstacles (4).size := 12
lvl3Obstacles (4).numpoints := 4
lvl3Obstacles (4).path (1).x := 389
lvl3Obstacles (4).path (1).y := 328
lvl3Obstacles (4).path (2).x := 510
lvl3Obstacles (4).path (2).y := 326
lvl3Obstacles (4).path (3).x := 510
lvl3Obstacles (4).path (3).y := 204
lvl3Obstacles (4).path (4).x := 389
lvl3Obstacles (4).path (4).y := 204
lvl3Obstacles (4).nextpoint := 2
lvl3Obstacles (4).speed := 6

%Level 3 - Obstacle #5
lvl3Obstacles (5).point.x := 509
lvl3Obstacles (5).point.y := 292
lvl3Obstacles (5).color := blue
lvl3Obstacles (5).size := 12
lvl3Obstacles (5).numpoints := 4
lvl3Obstacles (5).path (1).x := 389
lvl3Obstacles (5).path (1).y := 328
lvl3Obstacles (5).path (2).x := 510
lvl3Obstacles (5).path (2).y := 328
lvl3Obstacles (5).path (3).x := 510
lvl3Obstacles (5).path (3).y := 204
lvl3Obstacles (5).path (4).x := 389
lvl3Obstacles (5).path (4).y := 204
lvl3Obstacles (5).nextpoint := 3
lvl3Obstacles (5).speed := 6

%Level 3 - Obstacle #6
lvl3Obstacles (6).point.x := 509
lvl3Obstacles (6).point.y := 252
lvl3Obstacles (6).color := blue
lvl3Obstacles (6).size := 12
lvl3Obstacles (6).numpoints := 4
lvl3Obstacles (6).path (1).x := 389
lvl3Obstacles (6).path (1).y := 328
lvl3Obstacles (6).path (2).x := 510
lvl3Obstacles (6).path (2).y := 328
lvl3Obstacles (6).path (3).x := 510
lvl3Obstacles (6).path (3).y := 204
lvl3Obstacles (6).path (4).x := 389
lvl3Obstacles (6).path (4).y := 204
lvl3Obstacles (6).nextpoint := 3
lvl3Obstacles (6).speed := 6

%Level 3 - Obstacle #7
lvl3Obstacles (7).point.x := 509
lvl3Obstacles (7).point.y := 212
lvl3Obstacles (7).color := blue
lvl3Obstacles (7).size := 12
lvl3Obstacles (7).numpoints := 4
lvl3Obstacles (7).path (1).x := 389
lvl3Obstacles (7).path (1).y := 328
lvl3Obstacles (7).path (2).x := 510
lvl3Obstacles (7).path (2).y := 328
lvl3Obstacles (7).path (3).x := 510
lvl3Obstacles (7).path (3).y := 204
lvl3Obstacles (7).path (4).x := 389
lvl3Obstacles (7).path (4).y := 204
lvl3Obstacles (7).nextpoint := 3
lvl3Obstacles (7).speed := 6

%Level 3 - Obstacle #8
lvl3Obstacles (8).point.x := 484
lvl3Obstacles (8).point.y := 212
lvl3Obstacles (8).color := blue
lvl3Obstacles (8).size := 12
lvl3Obstacles (8).numpoints := 4
lvl3Obstacles (8).path (1).x := 389
lvl3Obstacles (8).path (1).y := 328
lvl3Obstacles (8).path (2).x := 510
lvl3Obstacles (8).path (2).y := 328
lvl3Obstacles (8).path (3).x := 510
lvl3Obstacles (8).path (3).y := 204
lvl3Obstacles (8).path (4).x := 389
lvl3Obstacles (8).path (4).y := 204
lvl3Obstacles (8).nextpoint := 4
lvl3Obstacles (8).speed := 6

%Level 3 - Obstacle #9
lvl3Obstacles (9).point.x := 442
lvl3Obstacles (9).point.y := 212
lvl3Obstacles (9).color := blue
lvl3Obstacles (9).size := 12
lvl3Obstacles (9).numpoints := 4
lvl3Obstacles (9).path (1).x := 389
lvl3Obstacles (9).path (1).y := 328
lvl3Obstacles (9).path (2).x := 510
lvl3Obstacles (9).path (2).y := 328
lvl3Obstacles (9).path (3).x := 510
lvl3Obstacles (9).path (3).y := 204
lvl3Obstacles (9).path (4).x := 389
lvl3Obstacles (9).path (4).y := 204
lvl3Obstacles (9).nextpoint := 4
lvl3Obstacles (9).speed := 6

%Level 3 - Obstacle #10
lvl3Obstacles (10).point.x := 402
lvl3Obstacles (10).point.y := 212
lvl3Obstacles (10).color := blue
lvl3Obstacles (10).size := 12
lvl3Obstacles (10).numpoints := 4
lvl3Obstacles (10).path (1).x := 389
lvl3Obstacles (10).path (1).y := 328
lvl3Obstacles (10).path (2).x := 510
lvl3Obstacles (10).path (2).y := 328
lvl3Obstacles (10).path (3).x := 510
lvl3Obstacles (10).path (3).y := 204
lvl3Obstacles (10).path (4).x := 389
lvl3Obstacles (10).path (4).y := 204
lvl3Obstacles (10).nextpoint := 4
lvl3Obstacles (10).speed := 6



%LEVEL 4 OBSTACLES
var lvl4Obstacles : array 1 .. 5 of Obstacle
%Level 4 - Obstacle #1
lvl4Obstacles (1).point.x := 460 + round (106 * cosd (360))
lvl4Obstacles (1).point.y := 316 + round (106 * sind (360))
lvl4Obstacles (1).color := blue
lvl4Obstacles (1).size := 12
lvl4Obstacles (1).numpoints := 90
for decreasing i : 90 .. 1
    lvl4Obstacles (1).path (91 - i).x := 460 + round (106 * cosd (i * 4))
    lvl4Obstacles (1).path (91 - i).y := 316 + round (106 * sind (i * 4))
end for
lvl4Obstacles (1).nextpoint := 2
lvl4Obstacles (1).speed := 8

%Level 4 - Obstacle #2
lvl4Obstacles (2).point.x := 460 + round (106 * cosd (270))
lvl4Obstacles (2).point.y := 316 + round (106 * sind (270))
lvl4Obstacles (2).color := blue
lvl4Obstacles (2).size := 12
lvl4Obstacles (2).numpoints := 90
for decreasing i : 90 .. 1
    lvl4Obstacles (2).path (91 - i).x := 460 + round (106 * cosd (270 + (i * 4)))
    lvl4Obstacles (2).path (91 - i).y := 316 + round (106 * sind (270 + (i * 4)))
end for
lvl4Obstacles (2).nextpoint := 2
lvl4Obstacles (2).speed := 8

%Level 4 - Obstacle #3
lvl4Obstacles (3).point.x := 460 + round (106 * cosd (180))
lvl4Obstacles (3).point.y := 316 + round (106 * sind (180))
lvl4Obstacles (3).color := blue
lvl4Obstacles (3).size := 12
lvl4Obstacles (3).numpoints := 90
for decreasing i : 90 .. 1
    lvl4Obstacles (3).path (91 - i).x := 460 + round (106 * cosd (180 + (i * 4)))
    lvl4Obstacles (3).path (91 - i).y := 316 + round (106 * sind (180 + (i * 4)))
end for
lvl4Obstacles (3).nextpoint := 2
lvl4Obstacles (3).speed := 8

%Level 4 - Obstacle #4
lvl4Obstacles (4).point.x := 460 + round (106 * cosd (90))
lvl4Obstacles (4).point.y := 316 + round (106 * sind (90))
lvl4Obstacles (4).color := blue
lvl4Obstacles (4).size := 12
lvl4Obstacles (4).numpoints := 90
for decreasing i : 90 .. 1
    lvl4Obstacles (4).path (91 - i).x := 460 + round (106 * cosd (90 + (i * 4)))
    lvl4Obstacles (4).path (91 - i).y := 316 + round (106 * sind (90 + (i * 4)))
end for
lvl4Obstacles (4).nextpoint := 2
lvl4Obstacles (4).speed := 8

%Level 4 - Obstacle 5
lvl4Obstacles (5).point.x := 460
lvl4Obstacles (5).point.y := 316
lvl4Obstacles (5).color := blue
lvl4Obstacles (5).size := 12
lvl4Obstacles (5).numpoints := 90
for decreasing i : 90 .. 1
    lvl4Obstacles (5).path (91 - i).x := 460 + round (60 * (cosd (i * 4)))
    lvl4Obstacles (5).path (91 - i).y := 316
end for
lvl4Obstacles (5).nextpoint := 2
lvl4Obstacles (5).speed := 8



%LEVEL 5 OBSTACLES
var lvl5Obstacles : array 1 .. 9 of Obstacle
%Level 5 - Obstacle #1
lvl5Obstacles (1).point.x := 425
lvl5Obstacles (1).point.y := 226
lvl5Obstacles (1).color := blue
lvl5Obstacles (1).size := 12
lvl5Obstacles (1).numpoints := 1
lvl5Obstacles (1).path (1).x := 425
lvl5Obstacles (1).path (1).y := 226
lvl5Obstacles (1).nextpoint := 1
lvl5Obstacles (1).speed := 1

%Level 5 - Obstacle #2
lvl5Obstacles (2).point.x := 425 + round (100 * cosd (360))
lvl5Obstacles (2).point.y := 226 + round (100 * sind (360))
lvl5Obstacles (2).color := blue
lvl5Obstacles (2).size := 12
lvl5Obstacles (2).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (2).path (0 + i).x := 425 + round (100 * cosd (i * 4))
    lvl5Obstacles (2).path (0 + i).y := 226 + round (100 * sind (i * 4))
end for
lvl5Obstacles (2).nextpoint := 2
lvl5Obstacles (2).speed := 8

%Level 5 - Obstacle #3
lvl5Obstacles (3).point.x := 425 + round (50 * cosd (360))
lvl5Obstacles (3).point.y := 226 + round (50 * sind (360))
lvl5Obstacles (3).color := yellow
lvl5Obstacles (3).size := 12
lvl5Obstacles (3).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (3).path (0 + i).x := 425 + round (50 * cosd (i * 4))
    lvl5Obstacles (3).path (0 + i).y := 226 + round (50 * sind (i * 4))
end for
lvl5Obstacles (3).nextpoint := 2
lvl5Obstacles (3).speed := 8

%Level 5 - Obstacle #4
lvl5Obstacles (4).point.x := 425 + round (100 * cosd (270))
lvl5Obstacles (4).point.y := 226 + round (100 * sind (270))
lvl5Obstacles (4).color := blue
lvl5Obstacles (4).size := 12
lvl5Obstacles (4).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (4).path (0 + i).x := 425 + round (100 * cosd (270 + (i * 4)))
    lvl5Obstacles (4).path (0 + i).y := 226 + round (100 * sind (270 + (i * 4)))
end for
lvl5Obstacles (4).nextpoint := 2
lvl5Obstacles (4).speed := 8

%Level 5 - Obstacle #5
lvl5Obstacles (5).point.x := 425 + round (50 * cosd (270))
lvl5Obstacles (5).point.y := 226 + round (50 * sind (270))
lvl5Obstacles (5).color := yellow
lvl5Obstacles (5).size := 12
lvl5Obstacles (5).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (5).path (0 + i).x := 425 + round (50 * cosd (270 + (i * 4)))
    lvl5Obstacles (5).path (0 + i).y := 226 + round (50 * sind (270 + (i * 4)))
end for
lvl5Obstacles (5).nextpoint := 2
lvl5Obstacles (5).speed := 8

%Level 5 - Obstacle #6
lvl5Obstacles (6).point.x := 425 + round (100 * cosd (180))
lvl5Obstacles (6).point.y := 226 + round (100 * sind (180))
lvl5Obstacles (6).color := blue
lvl5Obstacles (6).size := 12
lvl5Obstacles (6).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (6).path (0 + i).x := 425 + round (100 * cosd (180 + (i * 4)))
    lvl5Obstacles (6).path (0 + i).y := 226 + round (100 * sind (180 + (i * 4)))
end for
lvl5Obstacles (6).nextpoint := 2
lvl5Obstacles (6).speed := 8

%Level 5 - Obstacle #7
lvl5Obstacles (7).point.x := 425 + round (50 * cosd (180))
lvl5Obstacles (7).point.y := 226 + round (50 * sind (180))
lvl5Obstacles (7).color := yellow
lvl5Obstacles (7).size := 12
lvl5Obstacles (7).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (7).path (0 + i).x := 425 + round (50 * cosd (180 + (i * 4)))
    lvl5Obstacles (7).path (0 + i).y := 226 + round (50 * sind (180 + (i * 4)))
end for
lvl5Obstacles (7).nextpoint := 2
lvl5Obstacles (7).speed := 8

%Level 5 - Obstacle #8
lvl5Obstacles (8).point.x := 425 + round (100 * cosd (90))
lvl5Obstacles (8).point.y := 226 + round (100 * sind (90))
lvl5Obstacles (8).color := blue
lvl5Obstacles (8).size := 12
lvl5Obstacles (8).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (8).path (0 + i).x := 425 + round (100 * cosd (90 + (i * 4)))
    lvl5Obstacles (8).path (0 + i).y := 226 + round (100 * sind (90 + (i * 4)))
end for
lvl5Obstacles (8).nextpoint := 2
lvl5Obstacles (8).speed := 8

%Level 5 - Obstacle #9
lvl5Obstacles (9).point.x := 425 + round (50 * cosd (90))
lvl5Obstacles (9).point.y := 226 + round (50 * sind (90))
lvl5Obstacles (9).color := yellow
lvl5Obstacles (9).size := 12
lvl5Obstacles (9).numpoints := 90
for i : 1 .. 90
    lvl5Obstacles (9).path (0 + i).x := 425 + round (50 * cosd (90 + (i * 4)))
    lvl5Obstacles (9).path (0 + i).y := 226 + round (50 * sind (90 + (i * 4)))
end for
lvl5Obstacles (9).nextpoint := 2
lvl5Obstacles (9).speed := 8



%LEVEL 6 OBSTACLES
var lvl6Obstacles : array 1 .. 15 of Obstacle
%Level 6 - Obstacle #1
lvl6Obstacles (1).point.x := 756
lvl6Obstacles (1).point.y := 272
lvl6Obstacles (1).color := blue
lvl6Obstacles (1).size := 12
lvl6Obstacles (1).numpoints := 2
lvl6Obstacles (1).path (1).x := 756
lvl6Obstacles (1).path (1).y := 272
lvl6Obstacles (1).path (2).x := 704
lvl6Obstacles (1).path (2).y := 272
lvl6Obstacles (1).nextpoint := 2
lvl6Obstacles (1).speed := 3

%Level 6 - Obstacle #2
lvl6Obstacles (2).point.x := 704
lvl6Obstacles (2).point.y := 192
lvl6Obstacles (2).color := blue
lvl6Obstacles (2).size := 12
lvl6Obstacles (2).numpoints := 2
lvl6Obstacles (2).path (1).x := 756
lvl6Obstacles (2).path (1).y := 192
lvl6Obstacles (2).path (2).x := 704
lvl6Obstacles (2).path (2).y := 192
lvl6Obstacles (2).nextpoint := 1
lvl6Obstacles (2).speed := 3

%Level 6 - Obstacle #3
lvl6Obstacles (3).point.x := 590
lvl6Obstacles (3).point.y := 313
lvl6Obstacles (3).color := blue
lvl6Obstacles (3).size := 12
lvl6Obstacles (3).numpoints := 10
lvl6Obstacles (3).path (1).x := 550
lvl6Obstacles (3).path (1).y := 353
lvl6Obstacles (3).path (2).x := 550
lvl6Obstacles (3).path (2).y := 313
lvl6Obstacles (3).path (3).x := 590
lvl6Obstacles (3).path (3).y := 313
lvl6Obstacles (3).path (4).x := 590
lvl6Obstacles (3).path (4).y := 110
lvl6Obstacles (3).path (5).x := 672
lvl6Obstacles (3).path (5).y := 110
lvl6Obstacles (3).path (6).x := 672
lvl6Obstacles (3).path (6).y := 150
lvl6Obstacles (3).path (7).x := 672
lvl6Obstacles (3).path (7).y := 110
lvl6Obstacles (3).path (8).x := 590
lvl6Obstacles (3).path (8).y := 110
lvl6Obstacles (3).path (9).x := 590
lvl6Obstacles (3).path (9).y := 313
lvl6Obstacles (3).path (10).x := 550
lvl6Obstacles (3).path (10).y := 313
lvl6Obstacles (3).nextpoint := 2
lvl6Obstacles (3).speed := 8

%Level 6 - Obstacle #4
lvl6Obstacles (4).point.x := 230 + round (42 * cosd (360))
lvl6Obstacles (4).point.y := 312 + round (42 * sind (360))
lvl6Obstacles (4).color := blue
lvl6Obstacles (4).size := 12
lvl6Obstacles (4).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (4).path (61 - i).x := 230 + round (42 * cosd (i * 6))
    lvl6Obstacles (4).path (61 - i).y := 312 + round (42 * sind (i * 6))
end for
lvl6Obstacles (4).nextpoint := 2
lvl6Obstacles (4).speed := 20

%Level 6 - Obstacle #5
lvl6Obstacles (5).point.x := 230 + round (42 * cosd (180))
lvl6Obstacles (5).point.y := 312 + round (42 * sind (180))
lvl6Obstacles (5).color := blue
lvl6Obstacles (5).size := 12
lvl6Obstacles (5).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (5).path (61 - i).x := 230 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (5).path (61 - i).y := 312 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (5).nextpoint := 2
lvl6Obstacles (5).speed := 12

%Level 6 - Obstacle #6
lvl6Obstacles (6).point.x := 350 + round (42 * cosd (180))
lvl6Obstacles (6).point.y := 312 + round (42 * sind (180))
lvl6Obstacles (6).color := blue
lvl6Obstacles (6).size := 12
lvl6Obstacles (6).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (6).path (61 - i).x := 350 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (6).path (61 - i).y := 312 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (6).nextpoint := 2
lvl6Obstacles (6).speed := 12

%Level 6 - Obstacle #7
lvl6Obstacles (7).point.x := 350 + round (42 * cosd (360))
lvl6Obstacles (7).point.y := 312 + round (42 * sind (360))
lvl6Obstacles (7).color := blue
lvl6Obstacles (7).size := 12
lvl6Obstacles (7).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (7).path (61 - i).x := 350 + round (42 * cosd (i * 6))
    lvl6Obstacles (7).path (61 - i).y := 312 + round (42 * sind (i * 6))
end for
lvl6Obstacles (7).nextpoint := 2
lvl6Obstacles (7).speed := 12

%Level 6 - Obstacle #8
lvl6Obstacles (8).point.x := 470 + round (42 * cosd (180))
lvl6Obstacles (8).point.y := 312 + round (42 * sind (180))
lvl6Obstacles (8).color := blue
lvl6Obstacles (8).size := 12
lvl6Obstacles (8).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (8).path (61 - i).x := 470 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (8).path (61 - i).y := 312 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (8).nextpoint := 2
lvl6Obstacles (8).speed := 12

%Level 6 - Obstacle #9
lvl6Obstacles (9).point.x := 470 + round (42 * cosd (360))
lvl6Obstacles (9).point.y := 312 + round (42 * sind (360))
lvl6Obstacles (9).color := blue
lvl6Obstacles (9).size := 12
lvl6Obstacles (9).numpoints := 60
for decreasing i : 60 .. 1
    lvl6Obstacles (9).path (61 - i).x := 470 + round (42 * cosd (i * 6))
    lvl6Obstacles (9).path (61 - i).y := 312 + round (42 * sind (i * 6))
end for
lvl6Obstacles (9).nextpoint := 2
lvl6Obstacles (9).speed := 12

%Level 6 - Obstacle #10
lvl6Obstacles (10).point.x := 510 + round (42 * cosd (360))
lvl6Obstacles (10).point.y := 152 + round (42 * sind (360))
lvl6Obstacles (10).color := blue
lvl6Obstacles (10).size := 12
lvl6Obstacles (10).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (10).path (0 + i).x := 510 + round (42 * cosd (i * 6))
    lvl6Obstacles (10).path (0 + i).y := 152 + round (42 * sind (i * 6))
end for
lvl6Obstacles (10).nextpoint := 2
lvl6Obstacles (10).speed := 12

%Level 6 - Obstacle #11
lvl6Obstacles (11).point.x := 510 + round (42 * cosd (180))
lvl6Obstacles (11).point.y := 152 + round (42 * sind (180))
lvl6Obstacles (11).color := blue
lvl6Obstacles (11).size := 12
lvl6Obstacles (11).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (11).path (0 + i).x := 510 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (11).path (0 + i).y := 152 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (11).nextpoint := 2
lvl6Obstacles (11).speed := 12

%Level 6 - Obstacle #12
lvl6Obstacles (12).point.x := 390 + round (42 * cosd (360))
lvl6Obstacles (12).point.y := 152 + round (42 * sind (360))
lvl6Obstacles (12).color := blue
lvl6Obstacles (12).size := 12
lvl6Obstacles (12).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (12).path (0 + i).x := 390 + round (42 * cosd (i * 6))
    lvl6Obstacles (12).path (0 + i).y := 152 + round (42 * sind (i * 6))
end for
lvl6Obstacles (12).nextpoint := 2
lvl6Obstacles (12).speed := 12

%Level 6 - Obstacle #13
lvl6Obstacles (13).point.x := 390 + round (42 * cosd (180))
lvl6Obstacles (13).point.y := 152 + round (42 * sind (180))
lvl6Obstacles (13).color := blue
lvl6Obstacles (13).size := 12
lvl6Obstacles (13).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (13).path (0 + i).x := 390 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (13).path (0 + i).y := 152 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (13).nextpoint := 2
lvl6Obstacles (13).speed := 12

%Level 6 - Obstacle #14
lvl6Obstacles (14).point.x := 270 + round (42 * cosd (360))
lvl6Obstacles (14).point.y := 152 + round (42 * sind (360))
lvl6Obstacles (14).color := blue
lvl6Obstacles (14).size := 12
lvl6Obstacles (14).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (14).path (0 + i).x := 270 + round (42 * cosd (i * 6))
    lvl6Obstacles (14).path (0 + i).y := 152 + round (42 * sind (i * 6))
end for
lvl6Obstacles (14).nextpoint := 2
lvl6Obstacles (14).speed := 12

%Level 6 - Obstacle #15
lvl6Obstacles (15).point.x := 270 + round (42 * cosd (180))
lvl6Obstacles (15).point.y := 152 + round (42 * sind (180))
lvl6Obstacles (15).color := blue
lvl6Obstacles (15).size := 12
lvl6Obstacles (15).numpoints := 60
for i : 1 .. 60
    lvl6Obstacles (15).path (0 + i).x := 270 + round (42 * cosd (180 + (i * 6)))
    lvl6Obstacles (15).path (0 + i).y := 152 + round (42 * sind (180 + (i * 6)))
end for
lvl6Obstacles (15).nextpoint := 2
lvl6Obstacles (15).speed := 12



%LEVEL 7 OBSTACLES
var lvl7Obstacles : array 1 .. 15 of Obstacle
%Level 7 - Obstacle #1
lvl7Obstacles (1).point.x := 369
lvl7Obstacles (1).point.y := 400
lvl7Obstacles (1).color := blue
lvl7Obstacles (1).size := 12
lvl7Obstacles (1).numpoints := 2
lvl7Obstacles (1).path (1).x := 369
lvl7Obstacles (1).path (1).y := 400
lvl7Obstacles (1).path (2).x := 369
lvl7Obstacles (1).path (2).y := 360
lvl7Obstacles (1).nextpoint := 2
lvl7Obstacles (1).speed := 2

%Level 7 - Obstacle #2
lvl7Obstacles (2).point.x := 369
lvl7Obstacles (2).point.y := 360
lvl7Obstacles (2).color := blue
lvl7Obstacles (2).size := 12
lvl7Obstacles (2).numpoints := 2
lvl7Obstacles (2).path (1).x := 369
lvl7Obstacles (2).path (1).y := 360
lvl7Obstacles (2).path (2).x := 369
lvl7Obstacles (2).path (2).y := 320
lvl7Obstacles (2).nextpoint := 2
lvl7Obstacles (2).speed := 2

%Level 7 - Obstacle #3
lvl7Obstacles (3).point.x := 369
lvl7Obstacles (3).point.y := 320
lvl7Obstacles (3).color := blue
lvl7Obstacles (3).size := 12
lvl7Obstacles (3).numpoints := 2
lvl7Obstacles (3).path (1).x := 369
lvl7Obstacles (3).path (1).y := 320
lvl7Obstacles (3).path (2).x := 369
lvl7Obstacles (3).path (2).y := 280
lvl7Obstacles (3).nextpoint := 2
lvl7Obstacles (3).speed := 2

%Level 7 - Obstacle #4
lvl7Obstacles (4).point.x := 369
lvl7Obstacles (4).point.y := 280
lvl7Obstacles (4).color := blue
lvl7Obstacles (4).size := 12
lvl7Obstacles (4).numpoints := 2
lvl7Obstacles (4).path (1).x := 369
lvl7Obstacles (4).path (1).y := 280
lvl7Obstacles (4).path (2).x := 369
lvl7Obstacles (4).path (2).y := 240
lvl7Obstacles (4).nextpoint := 2
lvl7Obstacles (4).speed := 2

%Level 7 - Obstacle #5
lvl7Obstacles (5).point.x := 369
lvl7Obstacles (5).point.y := 240
lvl7Obstacles (5).color := blue
lvl7Obstacles (5).size := 12
lvl7Obstacles (5).numpoints := 2
lvl7Obstacles (5).path (1).x := 369
lvl7Obstacles (5).path (1).y := 240
lvl7Obstacles (5).path (2).x := 369
lvl7Obstacles (5).path (2).y := 200
lvl7Obstacles (5).nextpoint := 2
lvl7Obstacles (5).speed := 2

%Level 7 - Obstacle #6
lvl7Obstacles (6).point.x := 369
lvl7Obstacles (6).point.y := 200
lvl7Obstacles (6).color := blue
lvl7Obstacles (6).size := 12
lvl7Obstacles (6).numpoints := 2
lvl7Obstacles (6).path (1).x := 369
lvl7Obstacles (6).path (1).y := 200
lvl7Obstacles (6).path (2).x := 369
lvl7Obstacles (6).path (2).y := 160
lvl7Obstacles (6).nextpoint := 2
lvl7Obstacles (6).speed := 2

%Level 7 - Obstacle #7
lvl7Obstacles (7).point.x := 369
lvl7Obstacles (7).point.y := 160
lvl7Obstacles (7).color := blue
lvl7Obstacles (7).size := 12
lvl7Obstacles (7).numpoints := 2
lvl7Obstacles (7).path (1).x := 369
lvl7Obstacles (7).path (1).y := 160
lvl7Obstacles (7).path (2).x := 369
lvl7Obstacles (7).path (2).y := 120
lvl7Obstacles (7).nextpoint := 2
lvl7Obstacles (7).speed := 2

%Level 7 - Obstacle #8
lvl7Obstacles (8).point.x := 450
lvl7Obstacles (8).point.y := 360
lvl7Obstacles (8).color := blue
lvl7Obstacles (8).size := 12
lvl7Obstacles (8).numpoints := 2
lvl7Obstacles (8).path (1).x := 450
lvl7Obstacles (8).path (1).y := 360
lvl7Obstacles (8).path (2).x := 450
lvl7Obstacles (8).path (2).y := 400
lvl7Obstacles (8).nextpoint := 2
lvl7Obstacles (8).speed := 2

%Level 7 - Obstacle #9
lvl7Obstacles (9).point.x := 450
lvl7Obstacles (9).point.y := 320
lvl7Obstacles (9).color := blue
lvl7Obstacles (9).size := 12
lvl7Obstacles (9).numpoints := 2
lvl7Obstacles (9).path (1).x := 450
lvl7Obstacles (9).path (1).y := 320
lvl7Obstacles (9).path (2).x := 450
lvl7Obstacles (9).path (2).y := 360
lvl7Obstacles (9).nextpoint := 2
lvl7Obstacles (9).speed := 2

%Level 7 - Obstacle #10
lvl7Obstacles (10).point.x := 450
lvl7Obstacles (10).point.y := 280
lvl7Obstacles (10).color := blue
lvl7Obstacles (10).size := 12
lvl7Obstacles (10).numpoints := 2
lvl7Obstacles (10).path (1).x := 450
lvl7Obstacles (10).path (1).y := 280
lvl7Obstacles (10).path (2).x := 450
lvl7Obstacles (10).path (2).y := 320
lvl7Obstacles (10).nextpoint := 2
lvl7Obstacles (10).speed := 2

%Level 7 - Obstacle #11
lvl7Obstacles (11).point.x := 450
lvl7Obstacles (11).point.y := 240
lvl7Obstacles (11).color := blue
lvl7Obstacles (11).size := 12
lvl7Obstacles (11).numpoints := 2
lvl7Obstacles (11).path (1).x := 450
lvl7Obstacles (11).path (1).y := 240
lvl7Obstacles (11).path (2).x := 450
lvl7Obstacles (11).path (2).y := 280
lvl7Obstacles (11).nextpoint := 2
lvl7Obstacles (11).speed := 2

%Level 7 - Obstacle #12
lvl7Obstacles (12).point.x := 450
lvl7Obstacles (12).point.y := 200
lvl7Obstacles (12).color := blue
lvl7Obstacles (12).size := 12
lvl7Obstacles (12).numpoints := 2
lvl7Obstacles (12).path (1).x := 450
lvl7Obstacles (12).path (1).y := 200
lvl7Obstacles (12).path (2).x := 450
lvl7Obstacles (12).path (2).y := 240
lvl7Obstacles (12).nextpoint := 2
lvl7Obstacles (12).speed := 2

%Level 7 - Obstacle #13
lvl7Obstacles (13).point.x := 450
lvl7Obstacles (13).point.y := 160
lvl7Obstacles (13).color := blue
lvl7Obstacles (13).size := 12
lvl7Obstacles (13).numpoints := 2
lvl7Obstacles (13).path (1).x := 450
lvl7Obstacles (13).path (1).y := 160
lvl7Obstacles (13).path (2).x := 450
lvl7Obstacles (13).path (2).y := 200
lvl7Obstacles (13).nextpoint := 2
lvl7Obstacles (13).speed := 2

%Level 7 - Obstacle #14
lvl7Obstacles (14).point.x := 450
lvl7Obstacles (14).point.y := 120
lvl7Obstacles (14).color := blue
lvl7Obstacles (14).size := 12
lvl7Obstacles (14).numpoints := 2
lvl7Obstacles (14).path (1).x := 450
lvl7Obstacles (14).path (1).y := 120
lvl7Obstacles (14).path (2).x := 450
lvl7Obstacles (14).path (2).y := 160
lvl7Obstacles (14).nextpoint := 2
lvl7Obstacles (14).speed := 2

%Level 7 - Obstacle #15
lvl7Obstacles (15).point.x := 490
lvl7Obstacles (15).point.y := 400
lvl7Obstacles (15).color := yellow
lvl7Obstacles (15).size := 12
lvl7Obstacles (15).numpoints := 4
lvl7Obstacles (15).path (1).x := 490
lvl7Obstacles (15).path (1).y := 400
lvl7Obstacles (15).path (2).x := 530
lvl7Obstacles (15).path (2).y := 400
lvl7Obstacles (15).path (3).x := 530
lvl7Obstacles (15).path (3).y := 120
lvl7Obstacles (15).path (4).x := 530
lvl7Obstacles (15).path (4).y := 400
lvl7Obstacles (15).nextpoint := 2
lvl7Obstacles (15).speed := 5



%LEVEL 8 OBSTACLES
var lvl8Obstacles : array 1 .. 8 of Obstacle
%Level 8 - Obstacle #1
lvl8Obstacles (1).point.x := 310
lvl8Obstacles (1).point.y := 350
lvl8Obstacles (1).color := blue
lvl8Obstacles (1).size := 12
lvl8Obstacles (1).numpoints := 2
lvl8Obstacles (1).path (1).x := 310
lvl8Obstacles (1).path (1).y := 350
lvl8Obstacles (1).path (2).x := 310
lvl8Obstacles (1).path (2).y := 150
lvl8Obstacles (1).nextpoint := 2
lvl8Obstacles (1).speed := 10

%Level 8 - Obstacle #2
lvl8Obstacles (2).point.x := 350
lvl8Obstacles (2).point.y := 150
lvl8Obstacles (2).color := blue
lvl8Obstacles (2).size := 12
lvl8Obstacles (2).numpoints := 2
lvl8Obstacles (2).path (1).x := 350
lvl8Obstacles (2).path (1).y := 150
lvl8Obstacles (2).path (2).x := 350
lvl8Obstacles (2).path (2).y := 350
lvl8Obstacles (2).nextpoint := 2
lvl8Obstacles (2).speed := 10

%Level 8 - Obstacle #3
lvl8Obstacles (3).point.x := 390
lvl8Obstacles (3).point.y := 350
lvl8Obstacles (3).color := blue
lvl8Obstacles (3).size := 12
lvl8Obstacles (3).numpoints := 2
lvl8Obstacles (3).path (1).x := 390
lvl8Obstacles (3).path (1).y := 350
lvl8Obstacles (3).path (2).x := 390
lvl8Obstacles (3).path (2).y := 150
lvl8Obstacles (3).nextpoint := 2
lvl8Obstacles (3).speed := 10

%Level 8 - Obstacle #4
lvl8Obstacles (4).point.x := 590
lvl8Obstacles (4).point.y := 150
lvl8Obstacles (4).color := blue
lvl8Obstacles (4).size := 12
lvl8Obstacles (4).numpoints := 2
lvl8Obstacles (4).path (1).x := 590
lvl8Obstacles (4).path (1).y := 150
lvl8Obstacles (4).path (2).x := 590
lvl8Obstacles (4).path (2).y := 350
lvl8Obstacles (4).nextpoint := 2
lvl8Obstacles (4).speed := 10

%Level 8 - Obstacle #5
lvl8Obstacles (5).point.x := 550
lvl8Obstacles (5).point.y := 350
lvl8Obstacles (5).color := blue
lvl8Obstacles (5).size := 12
lvl8Obstacles (5).numpoints := 2
lvl8Obstacles (5).path (1).x := 550
lvl8Obstacles (5).path (1).y := 350
lvl8Obstacles (5).path (2).x := 550
lvl8Obstacles (5).path (2).y := 150
lvl8Obstacles (5).nextpoint := 2
lvl8Obstacles (5).speed := 10

%Level 8 - Obstacle #6
lvl8Obstacles (6).point.x := 430
lvl8Obstacles (6).point.y := 350
lvl8Obstacles (6).color := yellow
lvl8Obstacles (6).size := 12
lvl8Obstacles (6).numpoints := 2
lvl8Obstacles (6).path (1).x := 430
lvl8Obstacles (6).path (1).y := 350
lvl8Obstacles (6).path (2).x := 510
lvl8Obstacles (6).path (2).y := 350
lvl8Obstacles (6).nextpoint := 2
lvl8Obstacles (6).speed := 4

%Level 8 - Obstacle #7
lvl8Obstacles (7).point.x := 430
lvl8Obstacles (7).point.y := 270
lvl8Obstacles (7).color := purple
lvl8Obstacles (7).size := 12
lvl8Obstacles (7).numpoints := 2
lvl8Obstacles (7).path (1).x := 430
lvl8Obstacles (7).path (1).y := 270
lvl8Obstacles (7).path (2).x := 510
lvl8Obstacles (7).path (2).y := 270
lvl8Obstacles (7).nextpoint := 2
lvl8Obstacles (7).speed := 4

%Level 8 - Obstacle #8
lvl8Obstacles (8).point.x := 430
lvl8Obstacles (8).point.y := 193
lvl8Obstacles (8).color := yellow
lvl8Obstacles (8).size := 12
lvl8Obstacles (8).numpoints := 2
lvl8Obstacles (8).path (1).x := 430
lvl8Obstacles (8).path (1).y := 193
lvl8Obstacles (8).path (2).x := 510
lvl8Obstacles (8).path (2).y := 193
lvl8Obstacles (8).nextpoint := 2
lvl8Obstacles (8).speed := 4



%LEVEL 9 OBSTACLES
var lvl9Obstacles : array 1 .. 13 of Obstacle
%Level 9 - Obstacle #1
lvl9Obstacles (1).point.x := 170
lvl9Obstacles (1).point.y := 415
lvl9Obstacles (1).color := blue
lvl9Obstacles (1).size := 12
lvl9Obstacles (1).numpoints := 4
lvl9Obstacles (1).path (1).x := 170
lvl9Obstacles (1).path (1).y := 415
lvl9Obstacles (1).path (2).x := 170
lvl9Obstacles (1).path (2).y := 365
lvl9Obstacles (1).path (3).x := 90
lvl9Obstacles (1).path (3).y := 365
lvl9Obstacles (1).path (4).x := 170
lvl9Obstacles (1).path (4).y := 365
lvl9Obstacles (1).nextpoint := 2
lvl9Obstacles (1).speed := 9

%Level 9 - Obstacle #2
lvl9Obstacles (2).point.x := 250
lvl9Obstacles (2).point.y := 416
lvl9Obstacles (2).color := blue
lvl9Obstacles (2).size := 12
lvl9Obstacles (2).numpoints := 2
lvl9Obstacles (2).path (1).x := 250
lvl9Obstacles (2).path (1).y := 416
lvl9Obstacles (2).path (2).x := 250
lvl9Obstacles (2).path (2).y := 365
lvl9Obstacles (2).nextpoint := 2
lvl9Obstacles (2).speed := 3

%Level 9 - Obstacle #3
lvl9Obstacles (3).point.x := 330
lvl9Obstacles (3).point.y := 365
lvl9Obstacles (3).color := blue
lvl9Obstacles (3).size := 12
lvl9Obstacles (3).numpoints := 2
lvl9Obstacles (3).path (1).x := 330
lvl9Obstacles (3).path (1).y := 370
lvl9Obstacles (3).path (2).x := 372
lvl9Obstacles (3).path (2).y := 415
lvl9Obstacles (3).nextpoint := 2
lvl9Obstacles (3).speed := 3

%Level 9 - Obstacle #4
lvl9Obstacles (4).point.x := 86
lvl9Obstacles (4).point.y := 290
lvl9Obstacles (4).color := blue
lvl9Obstacles (4).size := 12
lvl9Obstacles (4).numpoints := 2
lvl9Obstacles (4).path (1).x := 86
lvl9Obstacles (4).path (1).y := 290
lvl9Obstacles (4).path (2).x := 136
lvl9Obstacles (4).path (2).y := 290
lvl9Obstacles (4).nextpoint := 2
lvl9Obstacles (4).speed := 3

%Level 9 - Obstacle #5
lvl9Obstacles (5).point.x := 90
lvl9Obstacles (5).point.y := 167
lvl9Obstacles (5).color := blue
lvl9Obstacles (5).size := 12
lvl9Obstacles (5).numpoints := 2
lvl9Obstacles (5).path (1).x := 86
lvl9Obstacles (5).path (1).y := 167
lvl9Obstacles (5).path (2).x := 136
lvl9Obstacles (5).path (2).y := 216
lvl9Obstacles (5).nextpoint := 2
lvl9Obstacles (5).speed := 3

%Level 9 - Obstacle #6
lvl9Obstacles (6).point.x := 324
lvl9Obstacles (6).point.y := 290
lvl9Obstacles (6).color := blue
lvl9Obstacles (6).size := 12
lvl9Obstacles (6).numpoints := 2
lvl9Obstacles (6).path (1).x := 324
lvl9Obstacles (6).path (1).y := 290
lvl9Obstacles (6).path (2).x := 374
lvl9Obstacles (6).path (2).y := 290
lvl9Obstacles (6).nextpoint := 2
lvl9Obstacles (6).speed := 3

%Level 9 - Obstacle #7
lvl9Obstacles (7).point.x := 210
lvl9Obstacles (7).point.y := 165
lvl9Obstacles (7).color := blue
lvl9Obstacles (7).size := 12
lvl9Obstacles (7).numpoints := 2
lvl9Obstacles (7).path (1).x := 210
lvl9Obstacles (7).path (1).y := 165
lvl9Obstacles (7).path (2).x := 210
lvl9Obstacles (7).path (2).y := 216
lvl9Obstacles (7).nextpoint := 2
lvl9Obstacles (7).speed := 3

%Level 9 - Obstacle #8
lvl9Obstacles (8).point.x := 410
lvl9Obstacles (8).point.y := 170
lvl9Obstacles (8).color := blue
lvl9Obstacles (8).size := 12
lvl9Obstacles (8).numpoints := 60
for decreasing i : 60 .. 1
    lvl9Obstacles (8).path (61 - i).x := 410 + round (120 * (cosd (i * 6)))
    lvl9Obstacles (8).path (61 - i).y := 170
end for
lvl9Obstacles (8).nextpoint := 2
lvl9Obstacles (8).speed := 3

%Level 9 - Obstacle #9
lvl9Obstacles (9).point.x := 590 + round (24 * cosd (360))
lvl9Obstacles (9).point.y := 190 + round (24 * sind (360))
lvl9Obstacles (9).color := blue
lvl9Obstacles (9).size := 12
lvl9Obstacles (9).numpoints := 60
for decreasing i : 60 .. 1
    lvl9Obstacles (9).path (61 - i).x := 590 + round (24 * cosd (i * 6))
    lvl9Obstacles (9).path (61 - i).y := 190 + round (24 * sind (i * 6))
end for
lvl9Obstacles (9).nextpoint := 2
lvl9Obstacles (9).speed := 3

%Level 9 - Obstacle #10
lvl9Obstacles (10).point.x := 610
lvl9Obstacles (10).point.y := 290
lvl9Obstacles (10).color := blue
lvl9Obstacles (10).size := 12
lvl9Obstacles (10).numpoints := 2
lvl9Obstacles (10).path (1).x := 610
lvl9Obstacles (10).path (1).y := 290
lvl9Obstacles (10).path (2).x := 565
lvl9Obstacles (10).path (2).y := 290
lvl9Obstacles (10).nextpoint := 2
lvl9Obstacles (10).speed := 3

%Level 9 - Obstacle #11
lvl9Obstacles (11).point.x := 565
lvl9Obstacles (11).point.y := 370
lvl9Obstacles (11).color := blue
lvl9Obstacles (11).size := 12
lvl9Obstacles (11).numpoints := 2
lvl9Obstacles (11).path (1).x := 565
lvl9Obstacles (11).path (1).y := 370
lvl9Obstacles (11).path (2).x := 610
lvl9Obstacles (11).path (2).y := 370
lvl9Obstacles (11).nextpoint := 2
lvl9Obstacles (11).speed := 3

%Level 9 - Obstacle #12
lvl9Obstacles (12).point.x := 737
lvl9Obstacles (12).point.y := 377
lvl9Obstacles (12).color := blue
lvl9Obstacles (12).size := 12
lvl9Obstacles (12).numpoints := 2
lvl9Obstacles (12).path (1).x := 737
lvl9Obstacles (12).path (1).y := 377
lvl9Obstacles (12).path (2).x := 685
lvl9Obstacles (12).path (2).y := 325
lvl9Obstacles (12).nextpoint := 2
lvl9Obstacles (12).speed := 3


%Level 9 - Obstacle #13
lvl9Obstacles (13).point.x := 735
lvl9Obstacles (13).point.y := 135
lvl9Obstacles (13).color := blue
lvl9Obstacles (13).size := 12
lvl9Obstacles (13).numpoints := 2
lvl9Obstacles (13).path (1).x := 735
lvl9Obstacles (13).path (1).y := 135
lvl9Obstacles (13).path (2).x := 565
lvl9Obstacles (13).path (2).y := 90
lvl9Obstacles (13).nextpoint := 2
lvl9Obstacles (13).speed := 3



%LEVEL 10 OBSTACLES
var lvl10Obstacles : array 1 .. 3 of Obstacle
%Level 10 - Obstacle #1
lvl10Obstacles (1).point.x := 287
lvl10Obstacles (1).point.y := 233
lvl10Obstacles (1).color := blue
lvl10Obstacles (1).size := 12
lvl10Obstacles (1).numpoints := 4
lvl10Obstacles (1).path (1).x := 287
lvl10Obstacles (1).path (1).y := 233
lvl10Obstacles (1).path (2).x := 333
lvl10Obstacles (1).path (2).y := 170
lvl10Obstacles (1).path (3).x := 287
lvl10Obstacles (1).path (3).y := 110
lvl10Obstacles (1).path (4).x := 333
lvl10Obstacles (1).path (4).y := 170
lvl10Obstacles (1).nextpoint := 2
lvl10Obstacles (1).speed := 4

%Level 10 - Obstacle #2
lvl10Obstacles (2).point.x := 330
lvl10Obstacles (2).point.y := 110
lvl10Obstacles (2).color := blue
lvl10Obstacles (2).size := 12
lvl10Obstacles (2).numpoints := 4
lvl10Obstacles (2).path (1).x := 330
lvl10Obstacles (2).path (1).y := 110
lvl10Obstacles (2).path (2).x := 450
lvl10Obstacles (2).path (2).y := 155
lvl10Obstacles (2).path (3).x := 570
lvl10Obstacles (2).path (3).y := 110
lvl10Obstacles (2).path (4).x := 450
lvl10Obstacles (2).path (4).y := 155
lvl10Obstacles (2).nextpoint := 2
lvl10Obstacles (2).speed := 4

%Level 10 - Obstacle #3
lvl10Obstacles (3).point.x := 610
lvl10Obstacles (3).point.y := 110
lvl10Obstacles (3).color := blue
lvl10Obstacles (3).size := 12
lvl10Obstacles (3).numpoints := 4
lvl10Obstacles (3).path (1).x := 610
lvl10Obstacles (3).path (1).y := 110
lvl10Obstacles (3).path (2).x := 570
lvl10Obstacles (3).path (2).y := 235
lvl10Obstacles (3).path (3).x := 610
lvl10Obstacles (3).path (3).y := 350
lvl10Obstacles (3).path (4).x := 570
lvl10Obstacles (3).path (4).y := 235
lvl10Obstacles (3).nextpoint := 2
lvl10Obstacles (3).speed := 4



%LEVEL 11 OBSTACLES
var lvl11Obstacles : array 1 .. 6 of Obstacle
%Level 11 - Obstacle #1
lvl11Obstacles (1).point.x := 267
lvl11Obstacles (1).point.y := 155
lvl11Obstacles (1).color := blue
lvl11Obstacles (1).size := 12
lvl11Obstacles (1).numpoints := 2
lvl11Obstacles (1).path (1).x := 267
lvl11Obstacles (1).path (1).y := 155
lvl11Obstacles (1).path (2).x := 633
lvl11Obstacles (1).path (2).y := 155
lvl11Obstacles (1).nextpoint := 2
lvl11Obstacles (1).speed := 14

%Level 11 - Obstacle #2
lvl11Obstacles (2).point.x := 633
lvl11Obstacles (2).point.y := 195
lvl11Obstacles (2).color := blue
lvl11Obstacles (2).size := 12
lvl11Obstacles (2).numpoints := 2
lvl11Obstacles (2).path (1).x := 633
lvl11Obstacles (2).path (1).y := 195
lvl11Obstacles (2).path (2).x := 267
lvl11Obstacles (2).path (2).y := 195
lvl11Obstacles (2).nextpoint := 2
lvl11Obstacles (2).speed := 14

%Level 11 - Obstacle #3
lvl11Obstacles (3).point.x := 267
lvl11Obstacles (3).point.y := 235
lvl11Obstacles (3).color := blue
lvl11Obstacles (3).size := 12
lvl11Obstacles (3).numpoints := 2
lvl11Obstacles (3).path (1).x := 267
lvl11Obstacles (3).path (1).y := 235
lvl11Obstacles (3).path (2).x := 633
lvl11Obstacles (3).path (2).y := 235
lvl11Obstacles (3).nextpoint := 2
lvl11Obstacles (3).speed := 14

%Level 11 - Obstacle #4
lvl11Obstacles (4).point.x := 633
lvl11Obstacles (4).point.y := 275
lvl11Obstacles (4).color := blue
lvl11Obstacles (4).size := 12
lvl11Obstacles (4).numpoints := 2
lvl11Obstacles (4).path (1).x := 633
lvl11Obstacles (4).path (1).y := 275
lvl11Obstacles (4).path (2).x := 267
lvl11Obstacles (4).path (2).y := 275
lvl11Obstacles (4).nextpoint := 2
lvl11Obstacles (4).speed := 14

%Level 11 - Obstacle #5
lvl11Obstacles (5).point.x := 267
lvl11Obstacles (5).point.y := 315
lvl11Obstacles (5).color := blue
lvl11Obstacles (5).size := 12
lvl11Obstacles (5).numpoints := 2
lvl11Obstacles (5).path (1).x := 267
lvl11Obstacles (5).path (1).y := 315
lvl11Obstacles (5).path (2).x := 633
lvl11Obstacles (5).path (2).y := 315
lvl11Obstacles (5).nextpoint := 2
lvl11Obstacles (5).speed := 14

%Level 11 - Obstacle #6
lvl11Obstacles (6).point.x := 633
lvl11Obstacles (6).point.y := 353
lvl11Obstacles (6).color := blue
lvl11Obstacles (6).size := 12
lvl11Obstacles (6).numpoints := 2
lvl11Obstacles (6).path (1).x := 633
lvl11Obstacles (6).path (1).y := 353
lvl11Obstacles (6).path (2).x := 267
lvl11Obstacles (6).path (2).y := 353
lvl11Obstacles (6).nextpoint := 2
lvl11Obstacles (6).speed := 14



%LEVEL 12 OBSTACLES
var lvl12Obstacles : array 1 .. 70 of Obstacle

%Level 12 - Obstacle 1-9 Properties (excluding y-coordinates)
for a : 1 .. 9
    lvl12Obstacles (a).point.x := 205
end for

for a : 1 .. 9
    lvl12Obstacles (a).color := blue
end for

for a : 1 .. 9
    lvl12Obstacles (a).size := 12
end for

for a : 1 .. 9
    lvl12Obstacles (a).numpoints := 1
end for

for a : 1 .. 9
    lvl12Obstacles (a).path (1).x := 205
end for

for a : 1 .. 9
    lvl12Obstacles (a).nextpoint := 1
end for

for a : 1 .. 9
    lvl12Obstacles (a).speed := 14
end for


%Level 12 - Obstacle #1 (y-coordinates)
lvl12Obstacles (1).point.y := 125
lvl12Obstacles (1).path (1).y := 125

%Level 12 - Obstacle #2 (y-coordinates)
lvl12Obstacles (2).point.y := 165
lvl12Obstacles (2).path (1).y := 165

%Level 12 - Obstacle #3 (y-coordinates)
lvl12Obstacles (3).point.y := 245
lvl12Obstacles (3).path (1).y := 245

%Level 12 - Obstacle #4 (y-coordinates)
lvl12Obstacles (4).point.y := 205
lvl12Obstacles (4).path (1).y := 205

%Level 12 - Obstacle #5 (y-coordinates)
lvl12Obstacles (5).point.y := 245
lvl12Obstacles (5).path (1).y := 245

%Level 12 - Obstacle #6 (y-coordinates)
lvl12Obstacles (6).point.y := 285
lvl12Obstacles (6).path (1).y := 285

%Level 12 - Obstacle #7 (y-coordinates)
lvl12Obstacles (7).point.y := 325
lvl12Obstacles (7).path (1).y := 325

%Level 12 - Obstacle #8 (y-coordinates)
lvl12Obstacles (8).point.y := 365
lvl12Obstacles (8).path (1).y := 365

%Level 12 - Obstacle #9 (y-coordinates)
lvl12Obstacles (9).point.y := 405
lvl12Obstacles (9).path (1).y := 405


%Level 12 - Obstacle 10-14 Properties (excluding y-coordinates)
for a : 10 .. 14
    lvl12Obstacles (a).point.x := 285
end for

for a : 10 .. 14
    lvl12Obstacles (a).color := blue
end for

for a : 10 .. 14
    lvl12Obstacles (a).size := 12
end for

for a : 10 .. 14
    lvl12Obstacles (a).numpoints := 1
end for

for a : 10 .. 14
    lvl12Obstacles (a).path (1).x := 285
end for

for a : 10 .. 14
    lvl12Obstacles (a).nextpoint := 1
end for

for a : 10 .. 14
    lvl12Obstacles (a).speed := 14
end for


%Level 12 - Obstacle #10 (y-coordinates)
lvl12Obstacles (10).point.y := 85
lvl12Obstacles (10).path (1).y := 85

%Level 12 - Obstacle #11 (y-coordinates)
lvl12Obstacles (11).point.y := 125
lvl12Obstacles (11).path (1).y := 125

%Level 12 - Obstacle #12 (y-coordinates)
lvl12Obstacles (12).point.y := 165
lvl12Obstacles (12).path (1).y := 165

%Level 12 - Obstacle #13 (y-coordinates)
lvl12Obstacles (13).point.y := 205
lvl12Obstacles (13).path (1).y := 205

%Level 12 - Obstacle #14 (y-coordinates)
lvl12Obstacles (14).point.y := 245
lvl12Obstacles (14).path (1).y := 245


%Level 12 - Obstacle 15-26 Properties (excluding x-coordinates)
for a : 15 .. 26
    lvl12Obstacles (a).point.y := 325
end for

for a : 15 .. 26
    lvl12Obstacles (a).color := blue
end for

for a : 15 .. 26
    lvl12Obstacles (a).size := 12
end for

for a : 15 .. 26
    lvl12Obstacles (a).numpoints := 1
end for

for a : 15 .. 26
    lvl12Obstacles (a).path (1).y := 325
end for

for a : 15 .. 26
    lvl12Obstacles (a).nextpoint := 1
end for

for a : 15 .. 26
    lvl12Obstacles (a).speed := 14
end for


%Level 12 - Obstacle #15 (x-coordinates)
lvl12Obstacles (15).point.x := 245
lvl12Obstacles (15).path (1).x := 245

%Level 12 - Obstacle #16 (x-coordinates)
lvl12Obstacles (16).point.x := 285
lvl12Obstacles (16).path (1).x := 285

%Level 12 - Obstacle #17 (x-coordinates)
lvl12Obstacles (17).point.x := 325
lvl12Obstacles (17).path (1).x := 325

%Level 12 - Obstacle #18 (x-coordinates)
lvl12Obstacles (18).point.x := 365
lvl12Obstacles (18).path (1).x := 365

%Level 12 - Obstacle #19 (x-coordinates)
lvl12Obstacles (19).point.x := 405
lvl12Obstacles (19).path (1).x := 405

%Level 12 - Obstacle #20 (x-coordinates)
lvl12Obstacles (20).point.x := 445
lvl12Obstacles (20).path (1).x := 445

%Level 12 - Obstacle #21 (x-coordinates)
lvl12Obstacles (21).point.x := 485
lvl12Obstacles (21).path (1).x := 485

%Level 12 - Obstacle #22 (x-coordinates)
lvl12Obstacles (22).point.x := 525
lvl12Obstacles (22).path (1).x := 525

%Level 12 - Obstacle #23 (x-coordinates)
lvl12Obstacles (23).point.x := 565
lvl12Obstacles (23).path (1).x := 565

%Level 12 - Obstacle #24 (x-coordinates)
lvl12Obstacles (24).point.x := 605
lvl12Obstacles (24).path (1).x := 605

%Level 12 - Obstacle #25 (x-coordinates)
lvl12Obstacles (25).point.x := 645
lvl12Obstacles (25).path (1).x := 645

%Level 12 - Obstacle #26 (x-coordinates)
lvl12Obstacles (26).point.x := 685
lvl12Obstacles (26).path (1).x := 685


%Level 12 - Obstacle 27-35 Properties (excluding y-coordinates)
for a : 27 .. 35
    lvl12Obstacles (a).point.x := 725
end for

for a : 27 .. 35
    lvl12Obstacles (a).color := blue
end for

for a : 27 .. 35
    lvl12Obstacles (a).size := 12
end for

for a : 27 .. 35
    lvl12Obstacles (a).numpoints := 1
end for

for a : 27 .. 35
    lvl12Obstacles (a).path (1).x := 725
end for

for a : 27 .. 35
    lvl12Obstacles (a).nextpoint := 1
end for

for a : 27 .. 35
    lvl12Obstacles (a).speed := 14
end for


%Level 12 - Obstacle #27 (y-coordinates)
lvl12Obstacles (27).point.y := 405
lvl12Obstacles (27).path (1).y := 405

%Level 12 - Obstacle #28 (y-coordinates)
lvl12Obstacles (28).point.y := 165
lvl12Obstacles (28).path (1).y := 165

%Level 12 - Obstacle #29 (y-coordinates)
lvl12Obstacles (29).point.y := 245
lvl12Obstacles (29).path (1).y := 245

%Level 12 - Obstacle #30 (y-coordinates)
lvl12Obstacles (30).point.y := 205
lvl12Obstacles (30).path (1).y := 205

%Level 12 - Obstacle #31 (y-coordinates)
lvl12Obstacles (31).point.y := 245
lvl12Obstacles (31).path (1).y := 245

%Level 12 - Obstacle #32 (y-coordinates)
lvl12Obstacles (32).point.y := 285
lvl12Obstacles (32).path (1).y := 285

%Level 12 - Obstacle #33 (y-coordinates)
lvl12Obstacles (33).point.y := 325
lvl12Obstacles (33).path (1).y := 325

%Level 12 - Obstacle #34 (y-coordinates)
lvl12Obstacles (34).point.y := 365
lvl12Obstacles (34).path (1).y := 365

%Level 12 - Obstacle #35 (y-coordinates)
lvl12Obstacles (35).point.y := 125
lvl12Obstacles (35).path (1).y := 125


%Level 12 - Obstacle 36-40 Properties (excluding y-coordinates)
for a : 36 .. 40
    lvl12Obstacles (a).point.x := 645
end for

for a : 36 .. 40
    lvl12Obstacles (a).color := blue
end for

for a : 36 .. 40
    lvl12Obstacles (a).size := 12
end for

for a : 36 .. 40
    lvl12Obstacles (a).numpoints := 1
end for

for a : 36 .. 40
    lvl12Obstacles (a).path (1).x := 645
end for

for a : 36 .. 40
    lvl12Obstacles (a).nextpoint := 1
end for

for a : 36 .. 40
    lvl12Obstacles (a).speed := 14
end for


%Level 12 - Obstacle #36 (y-coordinates)
lvl12Obstacles (36).point.y := 85
lvl12Obstacles (36).path (1).y := 85

%Level 12 - Obstacle #37 (y-coordinates)
lvl12Obstacles (37).point.y := 125
lvl12Obstacles (37).path (1).y := 125

%Level 12 - Obstacle #38 (y-coordinates)
lvl12Obstacles (38).point.y := 165
lvl12Obstacles (38).path (1).y := 165

%Level 12 - Obstacle #39 (y-coordinates)
lvl12Obstacles (39).point.y := 205
lvl12Obstacles (39).path (1).y := 205

%Level 12 - Obstacle #40 (y-coordinates)
lvl12Obstacles (40).point.y := 245
lvl12Obstacles (40).path (1).y := 245


%Level 12 - Obstacle 41-45 Properties (excluding y-coordinates)
for h : 41 .. 45
    lvl12Obstacles (h).point.x := 565
end for

for h : 41 .. 45
    lvl12Obstacles (h).color := blue
end for

for h : 41 .. 45
    lvl12Obstacles (h).size := 12
end for

for h : 41 .. 45
    lvl12Obstacles (h).numpoints := 1
end for

for h : 41 .. 45
    lvl12Obstacles (h).path (1).x := 565
end for

for h : 41 .. 45
    lvl12Obstacles (h).nextpoint := 1
end for

for h : 41 .. 45
    lvl12Obstacles (h).speed := 14
end for


%Level 12 - Obstacle #41 (y-coordinates)
lvl12Obstacles (41).point.y := 125
lvl12Obstacles (41).path (1).y := 125

%Level 12 - Obstacle #42 (y-coordinates)
lvl12Obstacles (42).point.y := 165
lvl12Obstacles (42).path (1).y := 165

%Level 12 - Obstacle #43 (y-coordinates)
lvl12Obstacles (43).point.y := 205
lvl12Obstacles (43).path (1).y := 205

%Level 12 - Obstacle #44 (y-coordinates)
lvl12Obstacles (44).point.y := 245
lvl12Obstacles (44).path (1).y := 245

%Level 12 - Obstacle #45 (y-coordinates)
lvl12Obstacles (45).point.y := 285
lvl12Obstacles (45).path (1).y := 285


%Level 12 - Obstacle 46-50 Properties (excluding y-coordinates)
for h : 46 .. 50
    lvl12Obstacles (h).point.x := 365
end for

for h : 46 .. 50
    lvl12Obstacles (h).color := blue
end for

for h : 46 .. 50
    lvl12Obstacles (h).size := 12
end for

for h : 46 .. 50
    lvl12Obstacles (h).numpoints := 1
end for

for h : 46 .. 50
    lvl12Obstacles (h).path (1).x := 365
end for

for h : 46 .. 50
    lvl12Obstacles (h).nextpoint := 1
end for

for h : 46 .. 50
    lvl12Obstacles (h).speed := 14
end for


%Level 12 - Obstacle #46 (y-coordinates)
lvl12Obstacles (46).point.y := 285
lvl12Obstacles (46).path (1).y := 285

%Level 12 - Obstacle #47 (y-coordinates)
lvl12Obstacles (47).point.y := 125
lvl12Obstacles (47).path (1).y := 125

%Level 12 - Obstacle #48 (y-coordinates)
lvl12Obstacles (48).point.y := 165
lvl12Obstacles (48).path (1).y := 165

%Level 12 - Obstacle #49 (y-coordinates)
lvl12Obstacles (49).point.y := 205
lvl12Obstacles (49).path (1).y := 205

%Level 12 - Obstacle #50 (y-coordinates)
lvl12Obstacles (50).point.y := 245
lvl12Obstacles (50).path (1).y := 245


%Level 12 - Obstacle 51-55 Properties (excluding y-coordinates)
for h : 51 .. 55
    lvl12Obstacles (h).point.x := 485
end for

for h : 51 .. 55
    lvl12Obstacles (h).color := blue
end for

for h : 51 .. 55
    lvl12Obstacles (h).size := 12
end for

for h : 51 .. 55
    lvl12Obstacles (h).numpoints := 1
end for

for h : 51 .. 55
    lvl12Obstacles (h).path (1).x := 485
end for

for h : 51 .. 55
    lvl12Obstacles (h).nextpoint := 1
end for

for h : 51 .. 55
    lvl12Obstacles (h).speed := 14
end for


%Level 12 - Obstacle #51 (y-coordinates)
lvl12Obstacles (51).point.y := 85
lvl12Obstacles (51).path (1).y := 85

%Level 12 - Obstacle #52 (y-coordinates)
lvl12Obstacles (52).point.y := 125
lvl12Obstacles (52).path (1).y := 125

%Level 12 - Obstacle #53 (y-coordinates)
lvl12Obstacles (53).point.y := 165
lvl12Obstacles (53).path (1).y := 165

%Level 12 - Obstacle #54 (y-coordinates)
lvl12Obstacles (54).point.y := 205
lvl12Obstacles (54).path (1).y := 205

%Level 12 - Obstacle #55 (y-coordinates)
lvl12Obstacles (55).point.y := 245
lvl12Obstacles (55).path (1).y := 245


%Level 12 - Obstacle 56-60 Properties (excluding y-coordinates)
for h : 56 .. 60
    lvl12Obstacles (h).point.x := 445
end for

for h : 56 .. 60
    lvl12Obstacles (h).color := blue
end for

for h : 56 .. 60
    lvl12Obstacles (h).size := 12
end for

for h : 56 .. 60
    lvl12Obstacles (h).numpoints := 1
end for

for h : 56 .. 60
    lvl12Obstacles (h).path (1).x := 445
end for

for h : 56 .. 60
    lvl12Obstacles (h).nextpoint := 1
end for

for h : 56 .. 60
    lvl12Obstacles (h).speed := 14
end for


%Level 12 - Obstacle #56 (y-coordinates)
lvl12Obstacles (56).point.y := 85
lvl12Obstacles (56).path (1).y := 85

%Level 12 - Obstacle #57 (y-coordinates)
lvl12Obstacles (57).point.y := 125
lvl12Obstacles (57).path (1).y := 125

%Level 12 - Obstacle #58 (y-coordinates)
lvl12Obstacles (58).point.y := 165
lvl12Obstacles (58).path (1).y := 165

%Level 12 - Obstacle #59 (y-coordinates)
lvl12Obstacles (59).point.y := 205
lvl12Obstacles (59).path (1).y := 205

%Level 12 - Obstacle #60 (y-coordinates)
lvl12Obstacles (60).point.y := 245
lvl12Obstacles (60).path (1).y := 245

%Level 12 - Obstacle #61
lvl12Obstacles (61).point.x := 245
lvl12Obstacles (61).point.y := 445
lvl12Obstacles (61).color := yellow
lvl12Obstacles (61).size := 12
lvl12Obstacles (61).numpoints := 2
lvl12Obstacles (61).path (1).x := 245
lvl12Obstacles (61).path (1).y := 445
lvl12Obstacles (61).path (2).x := 245
lvl12Obstacles (61).path (2).y := 365
lvl12Obstacles (61).nextpoint := 2
lvl12Obstacles (61).speed := 4

%Level 12 - Obstacle #62
lvl12Obstacles (62).point.x := 285
lvl12Obstacles (62).point.y := 365
lvl12Obstacles (62).color := yellow
lvl12Obstacles (62).size := 12
lvl12Obstacles (62).numpoints := 2
lvl12Obstacles (62).path (1).x := 285
lvl12Obstacles (62).path (1).y := 365
lvl12Obstacles (62).path (2).x := 285
lvl12Obstacles (62).path (2).y := 445
lvl12Obstacles (62).nextpoint := 2
lvl12Obstacles (62).speed := 4

%Level 12 - Obstacle #63
lvl12Obstacles (63).point.x := 325
lvl12Obstacles (63).point.y := 445
lvl12Obstacles (63).color := yellow
lvl12Obstacles (63).size := 12
lvl12Obstacles (63).numpoints := 2
lvl12Obstacles (63).path (1).x := 325
lvl12Obstacles (63).path (1).y := 445
lvl12Obstacles (63).path (2).x := 325
lvl12Obstacles (63).path (2).y := 365
lvl12Obstacles (63).nextpoint := 2
lvl12Obstacles (63).speed := 4

%Level 12 - Obstacle #64
lvl12Obstacles (64).point.x := 405
lvl12Obstacles (64).point.y := 365
lvl12Obstacles (64).color := yellow
lvl12Obstacles (64).size := 12
lvl12Obstacles (64).numpoints := 2
lvl12Obstacles (64).path (1).x := 405
lvl12Obstacles (64).path (1).y := 365
lvl12Obstacles (64).path (2).x := 405
lvl12Obstacles (64).path (2).y := 445
lvl12Obstacles (64).nextpoint := 2
lvl12Obstacles (64).speed := 4

%Level 12 - Obstacle #65
lvl12Obstacles (65).point.x := 445
lvl12Obstacles (65).point.y := 445
lvl12Obstacles (65).color := yellow
lvl12Obstacles (65).size := 12
lvl12Obstacles (65).numpoints := 2
lvl12Obstacles (65).path (1).x := 445
lvl12Obstacles (65).path (1).y := 445
lvl12Obstacles (65).path (2).x := 445
lvl12Obstacles (65).path (2).y := 365
lvl12Obstacles (65).nextpoint := 2
lvl12Obstacles (65).speed := 4

%Level 12 - Obstacle #66
lvl12Obstacles (66).point.x := 485
lvl12Obstacles (66).point.y := 365
lvl12Obstacles (66).color := yellow
lvl12Obstacles (66).size := 12
lvl12Obstacles (66).numpoints := 2
lvl12Obstacles (66).path (1).x := 485
lvl12Obstacles (66).path (1).y := 365
lvl12Obstacles (66).path (2).x := 485
lvl12Obstacles (66).path (2).y := 445
lvl12Obstacles (66).nextpoint := 2
lvl12Obstacles (66).speed := 4

%Level 12 - Obstacle #67
lvl12Obstacles (67).point.x := 525
lvl12Obstacles (67).point.y := 445
lvl12Obstacles (67).color := yellow
lvl12Obstacles (67).size := 12
lvl12Obstacles (67).numpoints := 2
lvl12Obstacles (67).path (1).x := 525
lvl12Obstacles (67).path (1).y := 445
lvl12Obstacles (67).path (2).x := 525
lvl12Obstacles (67).path (2).y := 365
lvl12Obstacles (67).nextpoint := 2
lvl12Obstacles (67).speed := 4

%Level 12 - Obstacle #68
lvl12Obstacles (68).point.x := 605
lvl12Obstacles (68).point.y := 365
lvl12Obstacles (68).color := yellow
lvl12Obstacles (68).size := 12
lvl12Obstacles (68).numpoints := 2
lvl12Obstacles (68).path (1).x := 605
lvl12Obstacles (68).path (1).y := 365
lvl12Obstacles (68).path (2).x := 605
lvl12Obstacles (68).path (2).y := 445
lvl12Obstacles (68).nextpoint := 2
lvl12Obstacles (68).speed := 4

%Level 12 - Obstacle #69
lvl12Obstacles (69).point.x := 645
lvl12Obstacles (69).point.y := 445
lvl12Obstacles (69).color := yellow
lvl12Obstacles (69).size := 12
lvl12Obstacles (69).numpoints := 2
lvl12Obstacles (69).path (1).x := 645
lvl12Obstacles (69).path (1).y := 445
lvl12Obstacles (69).path (2).x := 645
lvl12Obstacles (69).path (2).y := 365
lvl12Obstacles (69).nextpoint := 2
lvl12Obstacles (69).speed := 4

%Level 12 - Obstacle #70
lvl12Obstacles (70).point.x := 685
lvl12Obstacles (70).point.y := 365
lvl12Obstacles (70).color := yellow
lvl12Obstacles (70).size := 12
lvl12Obstacles (70).numpoints := 2
lvl12Obstacles (70).path (1).x := 685
lvl12Obstacles (70).path (1).y := 365
lvl12Obstacles (70).path (2).x := 685
lvl12Obstacles (70).path (2).y := 445
lvl12Obstacles (70).nextpoint := 2
lvl12Obstacles (70).speed := 4



%LEVEL 13 OBSTACLES
var lvl13Obstacles : array 1 .. 16 of Obstacle
%Level 13 - Obstacle #1
lvl13Obstacles (1).point.x := 330 + round (42 * cosd (180))
lvl13Obstacles (1).point.y := 222 + round (42 * sind (180))
lvl13Obstacles (1).color := blue
lvl13Obstacles (1).size := 12
lvl13Obstacles (1).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (1).path (0 + i).x := 330 + round (42 * cosd (180 + (i * 6)))
    lvl13Obstacles (1).path (0 + i).y := 222 + round (42 * sind (180 + (i * 6)))
end for
lvl13Obstacles (1).nextpoint := 2
lvl13Obstacles (1).speed := 5

%Level 13 - Obstacle #2
lvl13Obstacles (2).point.x := 330 + round (42 * cosd (360))
lvl13Obstacles (2).point.y := 222 + round (42 * sind (360))
lvl13Obstacles (2).color := blue
lvl13Obstacles (2).size := 12
lvl13Obstacles (2).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (2).path (0 + i).x := 330 + round (42 * cosd (360 + (i * 6)))
    lvl13Obstacles (2).path (0 + i).y := 222 + round (42 * sind (360 + (i * 6)))
end for
lvl13Obstacles (2).nextpoint := 2
lvl13Obstacles (2).speed := 5

%Level 13 - Obstacle #3
lvl13Obstacles (3).point.x := 330
lvl13Obstacles (3).point.y := 222
lvl13Obstacles (3).color := blue
lvl13Obstacles (3).size := 12
lvl13Obstacles (3).numpoints := 1
lvl13Obstacles (3).path (1).x := 330
lvl13Obstacles (3).path (1).y := 222
lvl13Obstacles (3).nextpoint := 1
lvl13Obstacles (3).speed := 1

%Level 13 - Obstacle #4
lvl13Obstacles (4).point.x := 330 + round (42 * cosd (90))
lvl13Obstacles (4).point.y := 222 + round (42 * sind (90))
lvl13Obstacles (4).color := blue
lvl13Obstacles (4).size := 12
lvl13Obstacles (4).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (4).path (0 + i).x := 330 + round (42 * cosd (90 + (i * 6)))
    lvl13Obstacles (4).path (0 + i).y := 222 + round (42 * sind (90 + (i * 6)))
end for
lvl13Obstacles (4).nextpoint := 2
lvl13Obstacles (4).speed := 5

%Level 13 - Obstacle #5
lvl13Obstacles (5).point.x := 450 + round (42 * cosd (180))
lvl13Obstacles (5).point.y := 222 + round (42 * sind (180))
lvl13Obstacles (5).color := blue
lvl13Obstacles (5).size := 12
lvl13Obstacles (5).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (5).path (0 + i).x := 450 + round (42 * cosd (180 + (i * 6)))
    lvl13Obstacles (5).path (0 + i).y := 222 + round (42 * sind (180 + (i * 6)))
end for
lvl13Obstacles (5).nextpoint := 2
lvl13Obstacles (5).speed := 5

%Level 13 - Obstacle #6
lvl13Obstacles (6).point.x := 450 + round (42 * cosd (360))
lvl13Obstacles (6).point.y := 222 + round (42 * sind (360))
lvl13Obstacles (6).color := blue
lvl13Obstacles (6).size := 12
lvl13Obstacles (6).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (6).path (0 + i).x := 450 + round (42 * cosd (360 + (i * 6)))
    lvl13Obstacles (6).path (0 + i).y := 222 + round (42 * sind (360 + (i * 6)))
end for
lvl13Obstacles (6).nextpoint := 2
lvl13Obstacles (6).speed := 5

%Level 13 - Obstacle #7
lvl13Obstacles (7).point.x := 450
lvl13Obstacles (7).point.y := 222
lvl13Obstacles (7).color := blue
lvl13Obstacles (7).size := 12
lvl13Obstacles (7).numpoints := 1
lvl13Obstacles (7).path (1).x := 450
lvl13Obstacles (7).path (1).y := 222
lvl13Obstacles (7).nextpoint := 1
lvl13Obstacles (7).speed := 1

%Level 13 - Obstacle #8
lvl13Obstacles (8).point.x := 450 + round (42 * cosd (270))
lvl13Obstacles (8).point.y := 222 + round (42 * sind (270))
lvl13Obstacles (8).color := blue
lvl13Obstacles (8).size := 12
lvl13Obstacles (8).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (8).path (0 + i).x := 450 + round (42 * cosd (270 + (i * 6)))
    lvl13Obstacles (8).path (0 + i).y := 222 + round (42 * sind (270 + (i * 6)))
end for
lvl13Obstacles (8).nextpoint := 2
lvl13Obstacles (8).speed := 5


%Level 13 - Obstacle #9
lvl13Obstacles (9).point.x := 570 + round (42 * cosd (180))
lvl13Obstacles (9).point.y := 222 + round (42 * sind (180))
lvl13Obstacles (9).color := blue
lvl13Obstacles (9).size := 12
lvl13Obstacles (9).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (9).path (0 + i).x := 570 + round (42 * cosd (180 + (i * 6)))
    lvl13Obstacles (9).path (0 + i).y := 222 + round (42 * sind (180 + (i * 6)))
end for
lvl13Obstacles (9).nextpoint := 2
lvl13Obstacles (9).speed := 5

%Level 13 - Obstacle #10
lvl13Obstacles (10).point.x := 570 + round (42 * cosd (360))
lvl13Obstacles (10).point.y := 222 + round (42 * sind (360))
lvl13Obstacles (10).color := blue
lvl13Obstacles (10).size := 12
lvl13Obstacles (10).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (10).path (0 + i).x := 570 + round (42 * cosd (360 + (i * 6)))
    lvl13Obstacles (10).path (0 + i).y := 222 + round (42 * sind (360 + (i * 6)))
end for
lvl13Obstacles (10).nextpoint := 2
lvl13Obstacles (10).speed := 5

%Level 13 - Obstacle #11
lvl13Obstacles (11).point.x := 570
lvl13Obstacles (11).point.y := 222
lvl13Obstacles (11).color := blue
lvl13Obstacles (11).size := 12
lvl13Obstacles (11).numpoints := 1
lvl13Obstacles (11).path (1).x := 570
lvl13Obstacles (11).path (1).y := 222
lvl13Obstacles (11).nextpoint := 1
lvl13Obstacles (11).speed := 1

%Level 13 - Obstacle #12
lvl13Obstacles (12).point.x := 570 + round (42 * cosd (90))
lvl13Obstacles (12).point.y := 222 + round (42 * sind (90))
lvl13Obstacles (12).color := blue
lvl13Obstacles (12).size := 12
lvl13Obstacles (12).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (12).path (0 + i).x := 570 + round (42 * cosd (90 + (i * 6)))
    lvl13Obstacles (12).path (0 + i).y := 222 + round (42 * sind (90 + (i * 6)))
end for
lvl13Obstacles (12).nextpoint := 2
lvl13Obstacles (12).speed := 5

%Level 13 - Obstacle #13
lvl13Obstacles (13).point.x := 690 + round (42 * cosd (180))
lvl13Obstacles (13).point.y := 222 + round (42 * sind (180))
lvl13Obstacles (13).color := blue
lvl13Obstacles (13).size := 12
lvl13Obstacles (13).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (13).path (0 + i).x := 690 + round (42 * cosd (180 + (i * 6)))
    lvl13Obstacles (13).path (0 + i).y := 222 + round (42 * sind (180 + (i * 6)))
end for
lvl13Obstacles (13).nextpoint := 2
lvl13Obstacles (13).speed := 5

%Level 13 - Obstacle #14
lvl13Obstacles (14).point.x := 690 + round (42 * cosd (360))
lvl13Obstacles (14).point.y := 222 + round (42 * sind (360))
lvl13Obstacles (14).color := blue
lvl13Obstacles (14).size := 12
lvl13Obstacles (14).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (14).path (0 + i).x := 690 + round (42 * cosd (360 + (i * 6)))
    lvl13Obstacles (14).path (0 + i).y := 222 + round (42 * sind (360 + (i * 6)))
end for
lvl13Obstacles (14).nextpoint := 2
lvl13Obstacles (14).speed := 5

%Level 13 - Obstacle #15
lvl13Obstacles (15).point.x := 690
lvl13Obstacles (15).point.y := 222
lvl13Obstacles (15).color := blue
lvl13Obstacles (15).size := 12
lvl13Obstacles (15).numpoints := 1
lvl13Obstacles (15).path (1).x := 690
lvl13Obstacles (15).path (1).y := 222
lvl13Obstacles (15).nextpoint := 1
lvl13Obstacles (15).speed := 1

%Level 13 - Obstacle #16
lvl13Obstacles (16).point.x := 690 + round (42 * cosd (270))
lvl13Obstacles (16).point.y := 222 + round (42 * sind (270))
lvl13Obstacles (16).color := blue
lvl13Obstacles (16).size := 12
lvl13Obstacles (16).numpoints := 60
for i : 1 .. 60
    lvl13Obstacles (16).path (0 + i).x := 690 + round (42 * cosd (270 + (i * 6)))
    lvl13Obstacles (16).path (0 + i).y := 222 + round (42 * sind (270 + (i * 6)))
end for
lvl13Obstacles (16).nextpoint := 2
lvl13Obstacles (16).speed := 5



%LEVEL 14 OBSTACLES
var lvl14Obstacles : array 1 .. 7 of Obstacle
%Level 14 - Obstacle #1
lvl14Obstacles (1).point.x := 565 + round (42 * cosd (360))
lvl14Obstacles (1).point.y := 347 + round (42 * sind (360))
lvl14Obstacles (1).color := blue
lvl14Obstacles (1).size := 12
lvl14Obstacles (1).numpoints := 60
for i : 1 .. 60
    lvl14Obstacles (1).path (0 + i).x := 565 + round (42 * cosd (360 + (i * 6)))
    lvl14Obstacles (1).path (0 + i).y := 347 + round (42 * sind (360 + (i * 6)))
end for
lvl14Obstacles (1).nextpoint := 2
lvl14Obstacles (1).speed := 6

%Level 14 - Obstacle #2
lvl14Obstacles (2).point.x := 565 + round (42 * cosd (180))
lvl14Obstacles (2).point.y := 347 + round (42 * sind (180))
lvl14Obstacles (2).color := blue
lvl14Obstacles (2).size := 12
lvl14Obstacles (2).numpoints := 60
for i : 1 .. 60
    lvl14Obstacles (2).path (0 + i).x := 565 + round (42 * cosd (180 + (i * 6)))
    lvl14Obstacles (2).path (0 + i).y := 347 + round (42 * sind (180 + (i * 6)))
end for
lvl14Obstacles (2).nextpoint := 2
lvl14Obstacles (2).speed := 6

%Level 14 - Obstacle #3
lvl14Obstacles (3).point.x := 284
lvl14Obstacles (3).point.y := 272
lvl14Obstacles (3).color := blue
lvl14Obstacles (3).size := 12
lvl14Obstacles (3).numpoints := 4
lvl14Obstacles (3).path (1).x := 284
lvl14Obstacles (3).path (1).y := 272
lvl14Obstacles (3).path (2).x := 284
lvl14Obstacles (3).path (2).y := 146
lvl14Obstacles (3).path (3).x := 324
lvl14Obstacles (3).path (3).y := 146
lvl14Obstacles (3).path (4).x := 284
lvl14Obstacles (3).path (4).y := 146
lvl14Obstacles (3).nextpoint := 2
lvl14Obstacles (3).speed := 4

%Level 14 - Obstacle #4
lvl14Obstacles (4).point.x := 565
lvl14Obstacles (4).point.y := 347
lvl14Obstacles (4).color := blue
lvl14Obstacles (4).size := 12
lvl14Obstacles (4).numpoints := 1
lvl14Obstacles (4).path (1).x := 565
lvl14Obstacles (4).path (1).y := 347
lvl14Obstacles (4).nextpoint := 1
lvl14Obstacles (4).speed := 4

%Level 14 - Obstacle #5
lvl14Obstacles (5).point.x := 364
lvl14Obstacles (5).point.y := 226
lvl14Obstacles (5).color := blue
lvl14Obstacles (5).size := 12
lvl14Obstacles (5).numpoints := 2
lvl14Obstacles (5).path (1).x := 364
lvl14Obstacles (5).path (1).y := 226
lvl14Obstacles (5).path (2).x := 364
lvl14Obstacles (5).path (2).y := 269
lvl14Obstacles (5).nextpoint := 2
lvl14Obstacles (5).speed := 3

%Level 14 - Obstacle #6
lvl14Obstacles (6).point.x := 444
lvl14Obstacles (6).point.y := 226
lvl14Obstacles (6).color := blue
lvl14Obstacles (6).size := 12
lvl14Obstacles (6).numpoints := 2
lvl14Obstacles (6).path (1).x := 444
lvl14Obstacles (6).path (1).y := 226
lvl14Obstacles (6).path (2).x := 444
lvl14Obstacles (6).path (2).y := 269
lvl14Obstacles (6).nextpoint := 2
lvl14Obstacles (6).speed := 3

%Level 14 - Obstacle #7
lvl14Obstacles (7).point.x := 404
lvl14Obstacles (7).point.y := 104
lvl14Obstacles (7).color := blue
lvl14Obstacles (7).size := 12
lvl14Obstacles (7).numpoints := 4
lvl14Obstacles (7).path (1).x := 404
lvl14Obstacles (7).path (1).y := 104
lvl14Obstacles (7).path (2).x := 404
lvl14Obstacles (7).path (2).y := 149
lvl14Obstacles (7).path (3).x := 484
lvl14Obstacles (7).path (3).y := 149
lvl14Obstacles (7).path (4).x := 404
lvl14Obstacles (7).path (4).y := 149
lvl14Obstacles (7).nextpoint := 2
lvl14Obstacles (7).speed := 3



%LEVEL 15 OBSTACLES
var lvl15Obstacles : array 1 .. 21 of Obstacle
%Level 15 - Obstacle #1
lvl15Obstacles (1).point.x := 650
lvl15Obstacles (1).point.y := 172
lvl15Obstacles (1).color := blue
lvl15Obstacles (1).size := 12
lvl15Obstacles (1).numpoints := 2
lvl15Obstacles (1).path (1).x := 650
lvl15Obstacles (1).path (1).y := 172
lvl15Obstacles (1).path (2).x := 650
lvl15Obstacles (1).path (2).y := 124
lvl15Obstacles (1).nextpoint := 2
lvl15Obstacles (1).speed := 3

%Level 15 - Obstacle #2
lvl15Obstacles (2).point.x := 610
lvl15Obstacles (2).point.y := 88
lvl15Obstacles (2).color := blue
lvl15Obstacles (2).size := 12
lvl15Obstacles (2).numpoints := 1
lvl15Obstacles (2).path (1).x := 610
lvl15Obstacles (2).path (1).y := 88
lvl15Obstacles (2).nextpoint := 1
lvl15Obstacles (2).speed := 1

%Level 15 - Obstacle #3
lvl15Obstacles (3).point.x := 530
lvl15Obstacles (3).point.y := 88
lvl15Obstacles (3).color := blue
lvl15Obstacles (3).size := 12
lvl15Obstacles (3).numpoints := 1
lvl15Obstacles (3).path (1).x := 530
lvl15Obstacles (3).path (1).y := 88
lvl15Obstacles (3).nextpoint := 1
lvl15Obstacles (3).speed := 1

%Level 15 - Obstacle #4
lvl15Obstacles (4).point.x := 450
lvl15Obstacles (4).point.y := 88
lvl15Obstacles (4).color := blue
lvl15Obstacles (4).size := 12
lvl15Obstacles (4).numpoints := 1
lvl15Obstacles (4).path (1).x := 450
lvl15Obstacles (4).path (1).y := 88
lvl15Obstacles (4).nextpoint := 1
lvl15Obstacles (4).speed := 1

%Level 15 - Obstacle #5
lvl15Obstacles (5).point.x := 370
lvl15Obstacles (5).point.y := 88
lvl15Obstacles (5).color := blue
lvl15Obstacles (5).size := 12
lvl15Obstacles (5).numpoints := 1
lvl15Obstacles (5).path (1).x := 370
lvl15Obstacles (5).path (1).y := 88
lvl15Obstacles (5).nextpoint := 1
lvl15Obstacles (5).speed := 1

%Level 15 - Obstacle #6
lvl15Obstacles (6).point.x := 290
lvl15Obstacles (6).point.y := 88
lvl15Obstacles (6).color := blue
lvl15Obstacles (6).size := 12
lvl15Obstacles (6).numpoints := 1
lvl15Obstacles (6).path (1).x := 290
lvl15Obstacles (6).path (1).y := 88
lvl15Obstacles (6).nextpoint := 1
lvl15Obstacles (6).speed := 1

%Level 15 - Obstacle #7
lvl15Obstacles (7).point.x := 210
lvl15Obstacles (7).point.y := 88
lvl15Obstacles (7).color := blue
lvl15Obstacles (7).size := 12
lvl15Obstacles (7).numpoints := 1
lvl15Obstacles (7).path (1).x := 210
lvl15Obstacles (7).path (1).y := 88
lvl15Obstacles (7).nextpoint := 1
lvl15Obstacles (7).speed := 1

%Level 15 - Obstacle #9
lvl15Obstacles (8).point.x := 570
lvl15Obstacles (8).point.y := 172
lvl15Obstacles (8).color := blue
lvl15Obstacles (8).size := 12
lvl15Obstacles (8).numpoints := 2
lvl15Obstacles (8).path (1).x := 570
lvl15Obstacles (8).path (1).y := 172
lvl15Obstacles (8).path (2).x := 570
lvl15Obstacles (8).path (2).y := 124
lvl15Obstacles (8).nextpoint := 2
lvl15Obstacles (8).speed := 3

%Level 15 - Obstacle #9
lvl15Obstacles (9).point.x := 490
lvl15Obstacles (9).point.y := 172
lvl15Obstacles (9).color := blue
lvl15Obstacles (9).size := 12
lvl15Obstacles (9).numpoints := 2
lvl15Obstacles (9).path (1).x := 490
lvl15Obstacles (9).path (1).y := 172
lvl15Obstacles (9).path (2).x := 490
lvl15Obstacles (9).path (2).y := 124
lvl15Obstacles (9).nextpoint := 2
lvl15Obstacles (9).speed := 3

%Level 15 - Obstacle #10
lvl15Obstacles (10).point.x := 410
lvl15Obstacles (10).point.y := 172
lvl15Obstacles (10).color := blue
lvl15Obstacles (10).size := 12
lvl15Obstacles (10).numpoints := 2
lvl15Obstacles (10).path (1).x := 410
lvl15Obstacles (10).path (1).y := 172
lvl15Obstacles (10).path (2).x := 410
lvl15Obstacles (10).path (2).y := 124
lvl15Obstacles (10).nextpoint := 2
lvl15Obstacles (10).speed := 3

%Level 15 - Obstacle #11
lvl15Obstacles (11).point.x := 330
lvl15Obstacles (11).point.y := 172
lvl15Obstacles (11).color := blue
lvl15Obstacles (11).size := 12
lvl15Obstacles (11).numpoints := 2
lvl15Obstacles (11).path (1).x := 330
lvl15Obstacles (11).path (1).y := 172
lvl15Obstacles (11).path (2).x := 330
lvl15Obstacles (11).path (2).y := 124
lvl15Obstacles (11).nextpoint := 2
lvl15Obstacles (11).speed := 3

%Level 15 - Obstacle #12
lvl15Obstacles (12).point.x := 250
lvl15Obstacles (12).point.y := 172
lvl15Obstacles (12).color := blue
lvl15Obstacles (12).size := 12
lvl15Obstacles (12).numpoints := 2
lvl15Obstacles (12).path (1).x := 250
lvl15Obstacles (12).path (1).y := 172
lvl15Obstacles (12).path (2).x := 250
lvl15Obstacles (12).path (2).y := 124
lvl15Obstacles (12).nextpoint := 2
lvl15Obstacles (12).speed := 3

%Level 15 - Obstacle #13
lvl15Obstacles (13).point.x := 170 + round (42 * cosd (360))
lvl15Obstacles (13).point.y := 247 + round (42 * sind (360))
lvl15Obstacles (13).color := blue
lvl15Obstacles (13).size := 12
lvl15Obstacles (13).numpoints := 60
for decreasing i : 60 .. 1
    lvl15Obstacles (13).path (61 - i).x := 170 + round (42 * cosd (360 + (i * 6)))
    lvl15Obstacles (13).path (61 - i).y := 247 + round (42 * sind (360 + (i * 6)))
end for
lvl15Obstacles (13).nextpoint := 2
lvl15Obstacles (13).speed := 5

%Level 15 - Obstacle #14
lvl15Obstacles (14).point.x := 170
lvl15Obstacles (14).point.y := 247
lvl15Obstacles (14).color := blue
lvl15Obstacles (14).size := 12
lvl15Obstacles (14).numpoints := 1
lvl15Obstacles (14).path (1).x := 170
lvl15Obstacles (14).path (1).y := 247
lvl15Obstacles (14).nextpoint := 1
lvl15Obstacles (14).speed := 1

%Level 15 - Obstacle #15
lvl15Obstacles (15).point.x := 170 + round (42 * cosd (180))
lvl15Obstacles (15).point.y := 247 + round (42 * sind (180))
lvl15Obstacles (15).color := blue
lvl15Obstacles (15).size := 12
lvl15Obstacles (15).numpoints := 60
for decreasing i : 60 .. 1
    lvl15Obstacles (15).path (61 - i).x := 170 + round (42 * cosd (180 + (i * 6)))
    lvl15Obstacles (15).path (61 - i).y := 247 + round (42 * sind (180 + (i * 6)))
end for
lvl15Obstacles (15).nextpoint := 2
lvl15Obstacles (15).speed := 5

%Level 15 - Obstacle #16
lvl15Obstacles (16).point.x := 170 + round (42 * cosd (90))
lvl15Obstacles (16).point.y := 247 + round (42 * sind (90))
lvl15Obstacles (16).color := blue
lvl15Obstacles (16).size := 12
lvl15Obstacles (16).numpoints := 60
for decreasing i : 60 .. 1
    lvl15Obstacles (16).path (61 - i).x := 170 + round (42 * cosd (90 + (i * 6)))
    lvl15Obstacles (16).path (61 - i).y := 247 + round (42 * sind (90 + (i * 6)))
end for
lvl15Obstacles (16).nextpoint := 2
lvl15Obstacles (16).speed := 5

%Level 15 - Obstacle #17
lvl15Obstacles (17).point.x := 210
lvl15Obstacles (17).point.y := 407
lvl15Obstacles (17).color := blue
lvl15Obstacles (17).size := 12
lvl15Obstacles (17).numpoints := 4
lvl15Obstacles (17).path (1).x := 210
lvl15Obstacles (17).path (1).y := 407
lvl15Obstacles (17).path (2).x := 290
lvl15Obstacles (17).path (2).y := 407
lvl15Obstacles (17).path (3).x := 290
lvl15Obstacles (17).path (3).y := 327
lvl15Obstacles (17).path (4).x := 210
lvl15Obstacles (17).path (4).y := 327
lvl15Obstacles (17).nextpoint := 1
lvl15Obstacles (17).speed := 5

%Level 15 - Obstacle #18
lvl15Obstacles (18).point.x := 250
lvl15Obstacles (18).point.y := 407
lvl15Obstacles (18).color := blue
lvl15Obstacles (18).size := 12
lvl15Obstacles (18).numpoints := 4
lvl15Obstacles (18).path (1).x := 210
lvl15Obstacles (18).path (1).y := 407
lvl15Obstacles (18).path (2).x := 290
lvl15Obstacles (18).path (2).y := 407
lvl15Obstacles (18).path (3).x := 290
lvl15Obstacles (18).path (3).y := 327
lvl15Obstacles (18).path (4).x := 210
lvl15Obstacles (18).path (4).y := 327
lvl15Obstacles (18).nextpoint := 2
lvl15Obstacles (18).speed := 5

%Level 15 - Obstacle #19
lvl15Obstacles (19).point.x := 290
lvl15Obstacles (19).point.y := 407
lvl15Obstacles (19).color := blue
lvl15Obstacles (19).size := 12
lvl15Obstacles (19).numpoints := 4
lvl15Obstacles (19).path (1).x := 210
lvl15Obstacles (19).path (1).y := 407
lvl15Obstacles (19).path (2).x := 290
lvl15Obstacles (19).path (2).y := 407
lvl15Obstacles (19).path (3).x := 290
lvl15Obstacles (19).path (3).y := 327
lvl15Obstacles (19).path (4).x := 210
lvl15Obstacles (19).path (4).y := 327
lvl15Obstacles (19).nextpoint := 3
lvl15Obstacles (19).speed := 5

%Level 15 - Obstacle #20
lvl15Obstacles (20).point.x := 290
lvl15Obstacles (20).point.y := 367
lvl15Obstacles (20).color := blue
lvl15Obstacles (20).size := 12
lvl15Obstacles (20).numpoints := 4
lvl15Obstacles (20).path (1).x := 210
lvl15Obstacles (20).path (1).y := 407
lvl15Obstacles (20).path (2).x := 290
lvl15Obstacles (20).path (2).y := 407
lvl15Obstacles (20).path (3).x := 290
lvl15Obstacles (20).path (3).y := 327
lvl15Obstacles (20).path (4).x := 210
lvl15Obstacles (20).path (4).y := 327
lvl15Obstacles (20).nextpoint := 3
lvl15Obstacles (20).speed := 5

%Level 15 - Obstacle #21
lvl15Obstacles (21).point.x := 290
lvl15Obstacles (21).point.y := 327
lvl15Obstacles (21).color := blue
lvl15Obstacles (21).size := 12
lvl15Obstacles (21).numpoints := 4
lvl15Obstacles (21).path (1).x := 210
lvl15Obstacles (21).path (1).y := 407
lvl15Obstacles (21).path (2).x := 290
lvl15Obstacles (21).path (2).y := 407
lvl15Obstacles (21).path (3).x := 290
lvl15Obstacles (21).path (3).y := 327
lvl15Obstacles (21).path (4).x := 210
lvl15Obstacles (21).path (4).y := 327
lvl15Obstacles (21).nextpoint := 4
lvl15Obstacles (21).speed := 5


var highScoreSpawnpoints : array 1 .. 10 of highscore

highScoreSpawnpoints (1).x := 190
highScoreSpawnpoints (1).y := 395

highScoreSpawnpoints (2).x := 190
highScoreSpawnpoints (2).y := 354

highScoreSpawnpoints (3).x := 190
highScoreSpawnpoints (3).y := 313

highScoreSpawnpoints (4).x := 190
highScoreSpawnpoints (4).y := 273

highScoreSpawnpoints (5).x := 190
highScoreSpawnpoints (5).y := 233

highScoreSpawnpoints (6).x := 190
highScoreSpawnpoints (6).y := 193

highScoreSpawnpoints (7).x := 190
highScoreSpawnpoints (7).y := 153

highScoreSpawnpoints (8).x := 190
highScoreSpawnpoints (8).y := 113

highScoreSpawnpoints (9).x := 190
highScoreSpawnpoints (9).y := 73

highScoreSpawnpoints (10).x := 190
highScoreSpawnpoints (10).y := 34
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%            GLOBAL VARIABLES             %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%isGameDone remains false for the entire life of the program until the user is ready to quit
var isGameDone : boolean := false

%if the game is actully completed
var mainGameDone : boolean := false

%Font variables
var scoreFont : int := Font.New ("Century Gothic:36")
var highScoreFont : int := Font.New ("Century Gothic:28")

%background images
var levels : array 1 .. 15 of int

%No Hover constant
const NO_BUTTON : int := 0

%Menu Screen Hover constants
const MENU_BUTTON : int := -1
const PLAY_BUTTON : int := -2
const LVL_SEL_BUTTON : int := -3
const HIGHSCORE_BUTTON : int := -4
const HELP_BUTTON : int := -5
const EXIT_BUTTON : int := -8

%Help Screen Hover constants
const HELP_BACK_BUTTON : int := -6

%Level Select Screen Hover constants
const LVLSEL_BACK_BUTTON : int := -7

%Highscore Screen Hover constants
const HIGHSCORE_BACK_BUTTON : int := -19

%Pause Screen Hover constants
const PAUSE_SCREEN_MENU_HOVER : int := -15
const PAUSE_SCREEN_HELP_HOVER : int := -16
const PAUSE_SCREEN_RETURN_HOVER : int := -17
const PAUSE_BUTTON : int := -18

const LEVEL_NUM : array 1 .. 15 of int := init (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)

%Game States
const MENU : int := 1
const PLAY : int := 2
const LVL_SEL : int := 3
const HELP : int := 4
const PAUSE : int := 5
const WIN : int := 6
const HIGHSCORE : int := 7

%set game state
var gameState : int := MENU

%Level Select Screen Picture Variables
var LvlSelScreen : int
var LvlSelScreenBack : int
var levelPicture : array 1 .. 15 of int

%Help Screen Picture Variables
var helpScreen : int
var helpScreenBack : int

%Menu Screen Picture Varaibles
var menuScreenStill : int
var buttonLvlSel : int
var buttonHelp : int
var buttonSettings : int
var buttonPlay : int
var exitButton : int
var exitButtonHover : int

var buttonHover : int := NO_BUTTON

%needed to know when importing of the images is finished
var importDone : boolean := false

%Pause Screen Picture Variables
var pauseScreenStillPic : int
var pauseScreenMenuPic : int
var pauseScreenHelpPic : int
var pauseScreenReturnPic : int
var pauseButtonStillPic : int
var pauseButtonHoverPic : int

%Highscore screen and win screen picture variables
var highScoreStillPic : int
var highScoreBackPic : int
var winScreenPic : int


%Set the program to handle multiple mouse buttons
Mouse.ButtonChoose ("multibutton")

%Mouse Variables
var mouseX : int
var mouseY : int
var mouseButton : int
var mouseLeft : int
var prevMouseX : int
var prevMouseY : int
var prevButton : int

%Boxx variables, SIZE, and squareX and sqaureY, speed
const SIZE : int := 30 %size of box
var squareX : int := 170 %squareX set to first level spawn points
var squareY : int := 190 %squareX set to first level spawn points
var squareSpeed : int := 5 % speed of square
var numOfDeath : int := 0

%input variables
var chars : array char of boolean
var previouschars : array char of boolean

%level variables
var currentLevel : int := 1
var nextLevel : boolean := false

%music settings
var musicMute : boolean := false
var soundMute : boolean := false
var playerSpeed : array 1 .. 3 of boolean := init (false, false, false)

%spawn points array
var spawnPoints : array 1 .. 15 of Point %point is the record at the top of program

%sound states, MENU, PLAY
var bgMusic : array 1 .. 2 of boolean := init (false, false)
var playMusic : boolean := false
var finished : boolean := false
var finished1 : boolean := false
var playSound : boolean := true
var hit : boolean := false

%Read/Write Setup
var fileNum : int
var fileName : string := "test.txt"
var highScoreNames : array 1 .. 10 of string := init ("Daniel", "Jonny", "Yasha", "Josh", "Steven", "Mr.Lane", "Aranga", "Muhammed", "Ron", "Arad")
var highScoreScores : array 1 .. 10 of int := init (0, 1, 10, 24, 63, 144, 145, 150, 321, 998)
var numScores : int := 0

%input for win screen
var input : string (1)
var name : string (15) := ""
var letter : string (1)
var inputTrue : boolean := false

var key : string (1) := ""
var currentButton : int := NO_BUTTON
var noButton : int := 0

var deltaX : int := 0
var deltaY : int := 0

var jx, jy, x, y, ox, oy : int := 1
var b1, b2, oB1, oB2 : boolean := false

var temp : int
var tempName : string

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%               SUBPROGRAMS               %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pre:None
%Post: Set up images for menu, level, and highscore
%Description: Loads all the pictures into the game by useing the Pic.FileNew command
procedure SetupImages ()

    %Set up background images below
    %Load Level Images, they are named level_1.bmp through level_15.bmp
    var fileName : string := ""
    for i : 1 .. upper (levels)
	fileName := "Level Screens/level_" + intstr (i) + ".bmp"
	levels (i) := Pic.FileNew (fileName)

    end for

    %Set up each image below
    %Load Level Select Images, they are named SL_Screen_1.bmp through SL_Screen_15.bmp
    var fileName1 : string := ""
    for i : 1 .. upper (levelPicture)
	fileName1 := "Menu Screens/Level Select/SL_Screen_" + intstr (i) + ".bmp"
	levelPicture (i) := Pic.FileNew (fileName1)
    end for

    %Images
    menuScreenStill := Pic.FileNew ("Menu Screens/Menu Screen/Menu_Screen1.bmp")
    buttonLvlSel := Pic.FileNew ("Menu Screens/Menu Screen/Menu_Screen_levelSelect_Rollover.bmp")
    buttonHelp := Pic.FileNew ("Menu Screens/Menu Screen/Menu_Screen_Help_Rollover.bmp")
    buttonSettings := Pic.FileNew ("Menu Screens/Menu Screen/Menu_Screen_Highscore_Rollover.bmp")
    buttonPlay := Pic.FileNew ("Menu Screens/Menu Screen/Menu_Screen_Play_Rollover.bmp")
    helpScreen := Pic.FileNew ("Menu Screens/Help Screen/Help_Screen.bmp")
    helpScreenBack := Pic.FileNew ("Menu Screens/Help Screen/Help_Screen_Pressed.bmp")
    LvlSelScreen := Pic.FileNew ("Menu Screens/Level Select/SL_Screen_Still.bmp")
    LvlSelScreenBack := Pic.FileNew ("Menu Screens/Level Select/SL_Screen_Back.bmp")
    exitButton := Pic.FileNew ("Exit_Button.bmp")
    exitButtonHover := Pic.FileNew ("Exit_Button_Pressed.bmp")

    pauseScreenStillPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Screen.bmp")
    pauseScreenMenuPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Screen_Menu.bmp")
    pauseScreenHelpPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Screen_Help.bmp")
    pauseScreenReturnPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Screen_Return.bmp")
    pauseButtonStillPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Button_Still.jpg")
    pauseButtonHoverPic := Pic.FileNew ("Menu Screens/Pause Screen/Pause_Button_Hover.jpg")

    highScoreStillPic := Pic.FileNew ("Menu Screens/HighScore_Screen_Still .bmp")
    highScoreBackPic := Pic.FileNew ("Menu Screens/HighScore_Screen_Pressed .bmp")

    winScreenPic := Pic.FileNew ("Menu Screens/Win_Screen_Still.bmp")
    importDone := true
end SetupImages

%Pre:None
%Post: Set spawnpoints for player in each level
%Description: Using the record above, the spawnpoints are all recorded here. Both the X and Y of the squares are recorded here.
procedure SetSpawnForPlayer ()

    spawnPoints (1).x := 170
    spawnPoints (1).y := 190

    spawnPoints (2).x := 195
    spawnPoints (2).y := 330

    spawnPoints (3).x := 375
    spawnPoints (3).y := 350

    spawnPoints (4).x := 343
    spawnPoints (4).y := 105

    spawnPoints (5).x := 410
    spawnPoints (5).y := 390

    spawnPoints (6).x := 115
    spawnPoints (6).y := 315

    spawnPoints (7).x := 594
    spawnPoints (7).y := 105

    spawnPoints (8).x := 155
    spawnPoints (8).y := 335

    spawnPoints (9).x := 95
    spawnPoints (9).y := 395

    spawnPoints (10).x := 295
    spawnPoints (10).y := 297

    spawnPoints (11).x := 435
    spawnPoints (11).y := 80

    spawnPoints (12).x := 110
    spawnPoints (12).y := 70

    spawnPoints (13).x := 195
    spawnPoints (13).y := 209

    spawnPoints (14).x := 549
    spawnPoints (14).y := 433

    spawnPoints (15).x := 734
    spawnPoints (15).y := 113
end SetSpawnForPlayer

%Pre:None
%Post: Draw High Scores in the highscore menu
%Description: Uses a for statement to draw all highscore names and deaths
procedure DrawHighScores ()
    for i : 1 .. 10
	Font.Draw (highScoreNames (i), highScoreSpawnpoints (i).x + 60, highScoreSpawnpoints (i).y, highScoreFont, 16)
	Font.Draw (intstr (highScoreScores (i)), highScoreSpawnpoints (i).x + 430, highScoreSpawnpoints (i).y, highScoreFont, 16)
	Font.Draw (intstr (i) + ".", highScoreSpawnpoints (i).x - 15, highScoreSpawnpoints (i).y, highScoreFont, 16)
    end for
end DrawHighScores

%Pre: location of mouse is stored in mouseX/mouseY. x1/x2 and y1/y2 set up the area for hover
%Post: Checks specific area to determine what button is being hovered
%Descrition: Determine if area is being hovered by comparing mouse x/y values and button x/y values.
%Checks specific area to determine what button is being hovered
function HoverCheck (x : int, y : int, x2 : int, y2 : int, mx : int, my : int) : boolean
    if (mx >= x) and (mx <= x2) and (my >= y) and (my <= y2) then
	result true
    end if
    result false
end HoverCheck

%Pre: Left mouse button is needed to click in the game.
%Post: Check to see if left mouse button is clicked
%Description:If left mouse button is clicked, function results true.
function NewClick () : boolean
    if (mouseLeft = 1) and (prevButton = 0) then
	result true
    else
	result false
    end if
end NewClick

%Pre: Level Number
%Post: When Clicked on, it goes to that level
%Description: Checks to see if the mouse is in that area, and if click
%             enter that level.
procedure GameStateLevel (lvlNum : int)
    buttonHover := LEVEL_NUM (lvlNum)
    if (NewClick () = true) then
	gameState := PLAY
	currentLevel := lvlNum
    end if
end GameStateLevel

%Pre:None
%Post: Updates high score information in text file.
%Description: Saves the current high score, this is done when user completed all 15 levels and entered a name.
procedure SaveTopScores ()
    open : fileNum, fileName, put

    put : fileNum, numScores

    for i : 1 .. 10

	put : fileNum, highScoreNames (i)
	put : fileNum, highScoreScores (i)
    end for

    close : fileNum
end SaveTopScores

%Pre:None
%Post: Gets the high score information from the text file
%Description: It uses I/O to find and retrieve high score information.
procedure ReadTopScores ()
    open : fileNum, fileName, get

    get : fileNum, numScores

    for i : 1 .. 10

	get : fileNum, highScoreNames (i)
	get : fileNum, highScoreScores (i)
    end for

    close : fileNum
end ReadTopScores


%Pre:None
%Post: Checks if player wins that level or game
%Description: Uses whatdotcolor to check and see if the user has entered the green area. With that calue, I check to see if the player goes to the next level
%             or goes to the win screen after the 15th level.
procedure CheckIfWin ()
    if (whatdotcolor (squareX - 1, squareY) = 144) or (whatdotcolor (squareX - 1, squareY) = 72) then
	if currentLevel <= 14 then
	    currentLevel := currentLevel + 1
	    squareX := spawnPoints (currentLevel).x
	    squareY := spawnPoints (currentLevel).y
	    nextLevel := true
	else
	    nextLevel := true
	    gameState := WIN
	    mainGameDone := true
	    Pic.Draw (winScreenPic, 0, 0, picUnderMerge)
	end if
    elsif (whatdotcolor (squareX - 1, squareY + SIZE) = 144) or (whatdotcolor (squareX - 1, squareY + SIZE) = 72) then
	if currentLevel <= 14 then
	    currentLevel := currentLevel + 1
	    squareX := spawnPoints (currentLevel).x
	    squareY := spawnPoints (currentLevel).y
	    nextLevel := true
	else
	    nextLevel := true
	    gameState := WIN
	    mainGameDone := true
	    Pic.Draw (winScreenPic, 0, 0, picUnderMerge)
	end if
    elsif (whatdotcolor (squareX + SIZE, squareY - 1) = 144) or (whatdotcolor (squareX + SIZE, squareY - 1) = 72) then
	if currentLevel <= 14 then
	    currentLevel := currentLevel + 1
	    squareX := spawnPoints (currentLevel).x
	    squareY := spawnPoints (currentLevel).y
	    nextLevel := true
	else
	    nextLevel := true
	    gameState := WIN
	    mainGameDone := true
	    Pic.Draw (winScreenPic, 0, 0, picUnderMerge)
	end if
    elsif (whatdotcolor (squareX, squareY - 1) = 144) or (whatdotcolor (squareX, squareY - 1) = 72) then
	if currentLevel <= 14 then
	    currentLevel := currentLevel + 1
	    squareX := spawnPoints (currentLevel).x
	    squareY := spawnPoints (currentLevel).y
	    nextLevel := true
	else
	    nextLevel := true
	    gameState := WIN
	    mainGameDone := true
	    Pic.Draw (winScreenPic, 0, 0, picUnderMerge)
	end if
    end if
end CheckIfWin

%Pre:None
%Post: Checks if player hits the ball
%Description: Uses whatdotcolor to check if the pixel next to it is a different color. Based on that value, I check if the player has collided with the circle.
procedure CheckIfLost ()
    if (whatdotcolor (squareX - 1, squareY) = blue) or (whatdotcolor (squareX - 1, squareY) = yellow) or (whatdotcolor (squareX - 1, squareY) = purple) then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX - 1, squareY + SIZE) = blue) or (whatdotcolor (squareX - 1, squareY + SIZE) = yellow) or (whatdotcolor (squareX - 1, squareY + SIZE) = purple) then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX + SIZE, squareY - 1) = blue) or (whatdotcolor (squareX + SIZE, squareY - 1) = yellow) or (whatdotcolor (squareX + SIZE, squareY - 1) = purple) then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX + SIZE + 1, squareY + SIZE) = blue) or (whatdotcolor (squareX + SIZE + 1, squareY + SIZE) = yellow) or (whatdotcolor (squareX + SIZE + 1, squareY + SIZE) = purple)
	    then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX + SIZE + 1, squareY + (SIZE div 2)) = blue) or (whatdotcolor (squareX + SIZE + 1, squareY + (SIZE div 2)) = yellow) or (whatdotcolor (squareX + SIZE + 1, squareY
	    + (SIZE div 2)) = purple) then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX - 1, squareY + (SIZE div 2)) = blue) or (whatdotcolor (squareX - 1, squareY + (SIZE div 2)) = yellow) or (whatdotcolor (squareX - 1, squareY + (SIZE div 2)) = purple)
	    then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX + (SIZE div 2), squareY - 1) = blue) or (whatdotcolor (squareX + (SIZE div 2), squareY - 1) = yellow) or (whatdotcolor (squareX + (SIZE div 2), squareY - 1) = purple)
	    then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    elsif (whatdotcolor (squareX + (SIZE div 2), squareY + SIZE + 1) = blue) or (whatdotcolor (squareX + (SIZE div 2), squareY + SIZE + 1) = yellow) or (whatdotcolor (squareX + (SIZE div 2), squareY
	    + SIZE + 1) = purple) then
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	hit := true
	numOfDeath := numOfDeath + 1
    end if
end CheckIfLost

%Pre:None
%Post: Resets all data
%Description: Resets all data after the user has entered their information in highscore.
procedure Reset ()
    currentLevel := 1
    squareX := spawnPoints (currentLevel).x
    squareY := spawnPoints (currentLevel).y
    name := ""
    numOfDeath := 0
    mainGameDone := false
end Reset

%Pre:None
%Post: Update all obstacle locations (x,y) in current level
%Description: By determining the changing x,y values, the absolute value is found for each variable (deltaX/deltaY).
%             Then Calculation is done to determine new x,y points ofr each obstacle by using round function. The next 
%             point is calculated to see if it had been reached.
procedure UpdateObstacles ()
    var deltaX : int
    var deltaY : int
    var absDeltaX : int
    var absDeltaY : int
    var moveX : int
    var moveY : int

    if (currentLevel = 1) then
	for i : 1 .. upper (lvl1Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl1Obstacles (i).path (lvl1Obstacles (i).nextpoint).x - lvl1Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl1Obstacles (i).path (lvl1Obstacles (i).nextpoint).y - lvl1Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl1Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl1Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl1Obstacles (i).point.x := lvl1Obstacles (i).point.x + moveX
	    lvl1Obstacles (i).point.y := lvl1Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl1Obstacles (i).point.x = lvl1Obstacles (i).path (lvl1Obstacles (i).nextpoint).x) and
		    (lvl1Obstacles (i).point.y = lvl1Obstacles (i).path (lvl1Obstacles (i).nextpoint).y) then
		lvl1Obstacles (i).nextpoint := lvl1Obstacles (i).nextpoint + 1
		if (lvl1Obstacles (i).nextpoint > lvl1Obstacles (i).numpoints) then
		    lvl1Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 2) then
	for i : 1 .. upper (lvl2Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl2Obstacles (i).path (lvl2Obstacles (i).nextpoint).x - lvl2Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl2Obstacles (i).path (lvl2Obstacles (i).nextpoint).y - lvl2Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl2Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl2Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl2Obstacles (i).point.x := lvl2Obstacles (i).point.x + moveX
	    lvl2Obstacles (i).point.y := lvl2Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl2Obstacles (i).point.x = lvl2Obstacles (i).path (lvl2Obstacles (i).nextpoint).x) and
		    (lvl2Obstacles (i).point.y = lvl2Obstacles (i).path (lvl2Obstacles (i).nextpoint).y) then
		lvl2Obstacles (i).nextpoint := lvl2Obstacles (i).nextpoint + 1
		if (lvl2Obstacles (i).nextpoint > lvl2Obstacles (i).numpoints) then
		    lvl2Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 3) then
	for i : 1 .. upper (lvl3Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl3Obstacles (i).path (lvl3Obstacles (i).nextpoint).x - lvl3Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl3Obstacles (i).path (lvl3Obstacles (i).nextpoint).y - lvl3Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl3Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl3Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl3Obstacles (i).point.x := lvl3Obstacles (i).point.x + moveX
	    lvl3Obstacles (i).point.y := lvl3Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl3Obstacles (i).point.x = lvl3Obstacles (i).path (lvl3Obstacles (i).nextpoint).x) and
		    (lvl3Obstacles (i).point.y = lvl3Obstacles (i).path (lvl3Obstacles (i).nextpoint).y) then
		lvl3Obstacles (i).nextpoint := lvl3Obstacles (i).nextpoint + 1
		if (lvl3Obstacles (i).nextpoint > lvl3Obstacles (i).numpoints) then
		    lvl3Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 4) then
	for i : 1 .. upper (lvl4Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl4Obstacles (i).path (lvl4Obstacles (i).nextpoint).x - lvl4Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl4Obstacles (i).path (lvl4Obstacles (i).nextpoint).y - lvl4Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl4Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl4Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl4Obstacles (i).point.x := lvl4Obstacles (i).point.x + moveX
	    lvl4Obstacles (i).point.y := lvl4Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl4Obstacles (i).point.x = lvl4Obstacles (i).path (lvl4Obstacles (i).nextpoint).x) and
		    (lvl4Obstacles (i).point.y = lvl4Obstacles (i).path (lvl4Obstacles (i).nextpoint).y) then
		lvl4Obstacles (i).nextpoint := lvl4Obstacles (i).nextpoint + 1
		if (lvl4Obstacles (i).nextpoint > lvl4Obstacles (i).numpoints) then
		    lvl4Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    elsif (currentLevel = 5) then
	for i : 1 .. upper (lvl5Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl5Obstacles (i).path (lvl5Obstacles (i).nextpoint).x - lvl5Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl5Obstacles (i).path (lvl5Obstacles (i).nextpoint).y - lvl5Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl5Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl5Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl5Obstacles (i).point.x := lvl5Obstacles (i).point.x + moveX
	    lvl5Obstacles (i).point.y := lvl5Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl5Obstacles (i).point.x = lvl5Obstacles (i).path (lvl5Obstacles (i).nextpoint).x) and
		    (lvl5Obstacles (i).point.y = lvl5Obstacles (i).path (lvl5Obstacles (i).nextpoint).y) then
		lvl5Obstacles (i).nextpoint := lvl5Obstacles (i).nextpoint + 1
		if (lvl5Obstacles (i).nextpoint > lvl5Obstacles (i).numpoints) then
		    lvl5Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    elsif (currentLevel = 6) then
	for i : 1 .. upper (lvl6Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl6Obstacles (i).path (lvl6Obstacles (i).nextpoint).x - lvl6Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl6Obstacles (i).path (lvl6Obstacles (i).nextpoint).y - lvl6Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl6Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl6Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl6Obstacles (i).point.x := lvl6Obstacles (i).point.x + moveX
	    lvl6Obstacles (i).point.y := lvl6Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl6Obstacles (i).point.x = lvl6Obstacles (i).path (lvl6Obstacles (i).nextpoint).x) and
		    (lvl6Obstacles (i).point.y = lvl6Obstacles (i).path (lvl6Obstacles (i).nextpoint).y) then
		lvl6Obstacles (i).nextpoint := lvl6Obstacles (i).nextpoint + 1
		if (lvl6Obstacles (i).nextpoint > lvl6Obstacles (i).numpoints) then
		    lvl6Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    elsif (currentLevel = 7) then
	for i : 1 .. upper (lvl7Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl7Obstacles (i).path (lvl7Obstacles (i).nextpoint).x - lvl7Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl7Obstacles (i).path (lvl7Obstacles (i).nextpoint).y - lvl7Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl7Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl7Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl7Obstacles (i).point.x := lvl7Obstacles (i).point.x + moveX
	    lvl7Obstacles (i).point.y := lvl7Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl7Obstacles (i).point.x = lvl7Obstacles (i).path (lvl7Obstacles (i).nextpoint).x) and
		    (lvl7Obstacles (i).point.y = lvl7Obstacles (i).path (lvl7Obstacles (i).nextpoint).y) then
		lvl7Obstacles (i).nextpoint := lvl7Obstacles (i).nextpoint + 1
		if (lvl7Obstacles (i).nextpoint > lvl7Obstacles (i).numpoints) then
		    lvl7Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 8) then
	for i : 1 .. upper (lvl8Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl8Obstacles (i).path (lvl8Obstacles (i).nextpoint).x - lvl8Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl8Obstacles (i).path (lvl8Obstacles (i).nextpoint).y - lvl8Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl8Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl8Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl8Obstacles (i).point.x := lvl8Obstacles (i).point.x + moveX
	    lvl8Obstacles (i).point.y := lvl8Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl8Obstacles (i).point.x = lvl8Obstacles (i).path (lvl8Obstacles (i).nextpoint).x) and
		    (lvl8Obstacles (i).point.y = lvl8Obstacles (i).path (lvl8Obstacles (i).nextpoint).y) then
		lvl8Obstacles (i).nextpoint := lvl8Obstacles (i).nextpoint + 1
		if (lvl8Obstacles (i).nextpoint > lvl8Obstacles (i).numpoints) then
		    lvl8Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 9) then
	for i : 1 .. upper (lvl9Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl9Obstacles (i).path (lvl9Obstacles (i).nextpoint).x - lvl9Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl9Obstacles (i).path (lvl9Obstacles (i).nextpoint).y - lvl9Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl9Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl9Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl9Obstacles (i).point.x := lvl9Obstacles (i).point.x + moveX
	    lvl9Obstacles (i).point.y := lvl9Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl9Obstacles (i).point.x = lvl9Obstacles (i).path (lvl9Obstacles (i).nextpoint).x) and
		    (lvl9Obstacles (i).point.y = lvl9Obstacles (i).path (lvl9Obstacles (i).nextpoint).y) then
		lvl9Obstacles (i).nextpoint := lvl9Obstacles (i).nextpoint + 1
		if (lvl9Obstacles (i).nextpoint > lvl9Obstacles (i).numpoints) then
		    lvl9Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 10) then
	for i : 1 .. upper (lvl10Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl10Obstacles (i).path (lvl10Obstacles (i).nextpoint).x - lvl10Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl10Obstacles (i).path (lvl10Obstacles (i).nextpoint).y - lvl10Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl10Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl10Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl10Obstacles (i).point.x := lvl10Obstacles (i).point.x + moveX
	    lvl10Obstacles (i).point.y := lvl10Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl10Obstacles (i).point.x = lvl10Obstacles (i).path (lvl10Obstacles (i).nextpoint).x) and
		    (lvl10Obstacles (i).point.y = lvl10Obstacles (i).path (lvl10Obstacles (i).nextpoint).y) then
		lvl10Obstacles (i).nextpoint := lvl10Obstacles (i).nextpoint + 1
		if (lvl10Obstacles (i).nextpoint > lvl10Obstacles (i).numpoints) then
		    lvl10Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    elsif (currentLevel = 11) then
	for i : 1 .. upper (lvl11Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl11Obstacles (i).path (lvl11Obstacles (i).nextpoint).x - lvl11Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl11Obstacles (i).path (lvl11Obstacles (i).nextpoint).y - lvl11Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl11Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl11Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl11Obstacles (i).point.x := lvl11Obstacles (i).point.x + moveX
	    lvl11Obstacles (i).point.y := lvl11Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl11Obstacles (i).point.x = lvl11Obstacles (i).path (lvl11Obstacles (i).nextpoint).x) and
		    (lvl11Obstacles (i).point.y = lvl11Obstacles (i).path (lvl11Obstacles (i).nextpoint).y) then
		lvl11Obstacles (i).nextpoint := lvl11Obstacles (i).nextpoint + 1
		if (lvl11Obstacles (i).nextpoint > lvl11Obstacles (i).numpoints) then
		    lvl11Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 12) then
	for i : 1 .. upper (lvl12Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl12Obstacles (i).path (lvl12Obstacles (i).nextpoint).x - lvl12Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl12Obstacles (i).path (lvl12Obstacles (i).nextpoint).y - lvl12Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl12Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl12Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl12Obstacles (i).point.x := lvl12Obstacles (i).point.x + moveX
	    lvl12Obstacles (i).point.y := lvl12Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl12Obstacles (i).point.x = lvl12Obstacles (i).path (lvl12Obstacles (i).nextpoint).x) and
		    (lvl12Obstacles (i).point.y = lvl12Obstacles (i).path (lvl12Obstacles (i).nextpoint).y) then
		lvl12Obstacles (i).nextpoint := lvl12Obstacles (i).nextpoint + 1
		if (lvl12Obstacles (i).nextpoint > lvl12Obstacles (i).numpoints) then
		    lvl12Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 13) then
	for i : 1 .. upper (lvl13Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl13Obstacles (i).path (lvl13Obstacles (i).nextpoint).x - lvl13Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl13Obstacles (i).path (lvl13Obstacles (i).nextpoint).y - lvl13Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl13Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl13Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl13Obstacles (i).point.x := lvl13Obstacles (i).point.x + moveX
	    lvl13Obstacles (i).point.y := lvl13Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl13Obstacles (i).point.x = lvl13Obstacles (i).path (lvl13Obstacles (i).nextpoint).x) and
		    (lvl13Obstacles (i).point.y = lvl13Obstacles (i).path (lvl13Obstacles (i).nextpoint).y) then
		lvl13Obstacles (i).nextpoint := lvl13Obstacles (i).nextpoint + 1
		if (lvl13Obstacles (i).nextpoint > lvl13Obstacles (i).numpoints) then
		    lvl13Obstacles (i).nextpoint := 1
		end if
	    end if
	end for

    elsif (currentLevel = 14) then
	for i : 1 .. upper (lvl14Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl14Obstacles (i).path (lvl14Obstacles (i).nextpoint).x - lvl14Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl14Obstacles (i).path (lvl14Obstacles (i).nextpoint).y - lvl14Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl14Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl14Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl14Obstacles (i).point.x := lvl14Obstacles (i).point.x + moveX
	    lvl14Obstacles (i).point.y := lvl14Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl14Obstacles (i).point.x = lvl14Obstacles (i).path (lvl14Obstacles (i).nextpoint).x) and
		    (lvl14Obstacles (i).point.y = lvl14Obstacles (i).path (lvl14Obstacles (i).nextpoint).y) then
		lvl14Obstacles (i).nextpoint := lvl14Obstacles (i).nextpoint + 1
		if (lvl14Obstacles (i).nextpoint > lvl14Obstacles (i).numpoints) then
		    lvl14Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    elsif (currentLevel = 15) then
	for i : 1 .. upper (lvl15Obstacles)
	    %Calculate difference in Y from ObstacleX to nextpointY
	    deltaX := lvl15Obstacles (i).path (lvl15Obstacles (i).nextpoint).x - lvl15Obstacles (i).point.x
	    absDeltaX := abs (deltaX)
	    deltaY := lvl15Obstacles (i).path (lvl15Obstacles (i).nextpoint).y - lvl15Obstacles (i).point.y
	    absDeltaY := abs (deltaY)

	    %Calculate movement for x,y
	    if absDeltaX > 0 then
		moveX := round (min (lvl15Obstacles (i).speed, absDeltaX) * (deltaX / absDeltaX))
	    else
		moveX := 0
	    end if
	    if absDeltaY > 0 then
		moveY := round (min (lvl15Obstacles (i).speed, absDeltaY) * (deltaY / absDeltaY))
	    else
		moveY := 0
	    end if

	    %Move x,y
	    lvl15Obstacles (i).point.x := lvl15Obstacles (i).point.x + moveX
	    lvl15Obstacles (i).point.y := lvl15Obstacles (i).point.y + moveY

	    %Check to see if nextpoint is reached
	    if (lvl15Obstacles (i).point.x = lvl15Obstacles (i).path (lvl15Obstacles (i).nextpoint).x) and
		    (lvl15Obstacles (i).point.y = lvl15Obstacles (i).path (lvl15Obstacles (i).nextpoint).y) then
		lvl15Obstacles (i).nextpoint := lvl15Obstacles (i).nextpoint + 1
		if (lvl15Obstacles (i).nextpoint > lvl15Obstacles (i).numpoints) then
		    lvl15Obstacles (i).nextpoint := 1
		end if
	    end if
	end for
    end if
end UpdateObstacles


%Pre:None
%Post: Updates player, sound, menu, and other states of game.
%Description: Looks at the state of the game and updates that portion of it. Also has border collision detection in in
procedure Update ()
    Mouse.Where (mouseX, mouseY, mouseButton) %locates mouse for advanced input system
    mouseLeft := mouseButton mod 10

    if (gameState = MENU) then
	if (HoverCheck (180, 60, 345, 140, mouseX, mouseY) = true) then %Checks where the mouse is and updates the screen with it. (Does this for all buttons.)
	    buttonHover := LVL_SEL_BUTTON
	    if (NewClick () = true) then
		gameState := LVL_SEL
	    end if
	elsif (HoverCheck (370, 60, 533, 140, mouseX, mouseY) = true) then
	    buttonHover := HELP_BUTTON
	    if (NewClick () = true) then
		gameState := HELP
	    end if
	elsif (HoverCheck (555, 60, 720, 140, mouseX, mouseY) = true) then
	    buttonHover := HIGHSCORE_BUTTON
	    if (NewClick () = true) then
		gameState := HIGHSCORE
	    end if
	elsif (HoverCheck (180, 162, 720, 306, mouseX, mouseY) = true) then
	    buttonHover := PLAY_BUTTON
	    if (NewClick () = true) then
		gameState := PLAY
	    end if
	elsif (HoverCheck (15, 12, 75, 35, mouseX, mouseY) = true) then
	    buttonHover := EXIT_BUTTON
	    if (NewClick () = true) then
		isGameDone := true
	    end if
	else
	    buttonHover := NO_BUTTON
	end if

	if (currentButton = LVL_SEL_BUTTON) then
	    buttonHover := LVL_SEL_BUTTON
	    if (key = (KEY_ENTER)) then
		gameState := LVL_SEL
	    end if
	elsif (currentButton = HELP_BUTTON) then
	    buttonHover := HELP_BUTTON
	    if (key = (KEY_ENTER)) then
		gameState := HELP
	    end if
	elsif (currentButton = HIGHSCORE_BUTTON) then
	    buttonHover := HIGHSCORE_BUTTON
	    if (key = (KEY_ENTER)) then
		gameState := HIGHSCORE
	    end if
	elsif (currentButton = PLAY_BUTTON) then
	    buttonHover := PLAY_BUTTON
	    if (key = (KEY_ENTER)) then
		gameState := PLAY
	    end if
	end if




    elsif (gameState = PLAY) then
	Pic.Draw (levels (currentLevel), 0, 0, picUnderMerge)     %level needs to be drawn here or collison detection wont work

	%Enemys are updated here
	UpdateObstacles ()


%The following is the controller code..
%If the you plug a Xbox controller in, it will work, but the border collision is not compatable.

	%reset deltas
	deltaX := 0
	deltaY := 0

       /* Joystick.GetInfo (joystick1, jx, jy, b1, b2)
	% Convert joystick coordinates into screen coordinates.
	x := round (maxx * (jx - joyMin) / (joyMax - joyMin))
	y := round (maxy * (jy - joyMin) / (joyMax - joyMin))

	if x not= ox or y not= oy or b1 not= oB1 or b2 not= oB2 then
	    %Done to trigger new actions if necessary
	    ox := x
	    oy := y
	    oB1 := b1
	    oB2 := b2
	end if
*/
	%Calculate deltas
	%deltaX := round ((jx / joyMax) * squareSpeed)
	% deltaY := round ((jy / joyMax) * squareSpeed)

	%squareX := squareX + deltaX
	%squareY := squareY + deltaY

	% Border collision
	locatexy (10,500)


	if (whatdotcolor (squareX, squareY + SIZE + squareSpeed) not= 7) then
	    if (whatdotcolor (squareX + SIZE, squareY + SIZE + squareSpeed) not= 7) then
		squareY := squareY + squareSpeed
	    end if
	end if


	if (whatdotcolor (squareX + SIZE + squareSpeed, squareY) not= 7) then
	    if (whatdotcolor (squareX + SIZE + squareSpeed, squareY + SIZE) not= 7) then
		squareX := squareX + squareSpeed
	    end if
	end if

	if (whatdotcolor (squareX, squareY - squareSpeed) not= 7) then
	    if (whatdotcolor (squareX + SIZE, squareY - squareSpeed) not= 7) then
		squareY := squareY - squareSpeed
	    end if
	end if

	if (whatdotcolor (squareX - squareSpeed, squareY) not= 7) then
	    if (whatdotcolor (squareX - squareSpeed, squareY + SIZE) not= 7) then
		squareX := squareX - squareSpeed
	    end if

	end if

	%Control square here, and intagrated border collison detection.
	if chars (KEY_UP_ARROW) then
	    if (whatdotcolor (squareX, squareY + SIZE + squareSpeed) not= 7) then
		if (whatdotcolor (squareX + SIZE, squareY + SIZE + squareSpeed) not= 7) then
		    squareY := squareY + squareSpeed
		end if
	    end if
	end if
	if chars (KEY_RIGHT_ARROW) then
	    if (whatdotcolor (squareX + SIZE + squareSpeed, squareY) not= 7) then
		if (whatdotcolor (squareX + SIZE + squareSpeed, squareY + SIZE) not= 7) then
		    squareX := squareX + squareSpeed
		end if
	    end if
	end if
	if chars (KEY_DOWN_ARROW) then
	    if (whatdotcolor (squareX, squareY - squareSpeed) not= 7) then
		if (whatdotcolor (squareX + SIZE, squareY - squareSpeed) not= 7) then
		    squareY := squareY - squareSpeed
		end if
	    end if
	end if
	if chars (KEY_LEFT_ARROW) then
	    if (whatdotcolor (squareX - squareSpeed, squareY) not= 7) then
		if (whatdotcolor (squareX - squareSpeed, squareY + SIZE) not= 7) then
		    squareX := squareX - squareSpeed
		end if
	    end if
	end if

	if (HoverCheck (12, 580, 157, 620, mouseX, mouseY) = true) then
	    buttonHover := PAUSE_BUTTON
	    if (NewClick () = true) then
		gameState := PAUSE
	    end if
	else
	    buttonHover := NO_BUTTON
	end if

	%Can pause the game at anytime by hitting P on your keyboard
	if (chars ('p') and not previouschars ('p')) then
	    gameState := PAUSE
	end if

	%Can skip a level with tapping N on your keyboard
	if (chars ('n') and not previouschars ('n')) then
	    currentLevel := currentLevel + 1

	    %if you are at level 15, it loops to level 1 here (only happens if N is clicked
	    if (currentLevel = 16) then
		currentLevel := 1
	    end if
	    squareX := spawnPoints (currentLevel).x
	    squareY := spawnPoints (currentLevel).y
	end if

    elsif (gameState = LVL_SEL) then
	if (HoverCheck (25, 550, 110, 590, mouseX, mouseY) = true) then
	    buttonHover := LVLSEL_BACK_BUTTON
	    if (NewClick () = true) then
		gameState := MENU
	    end if
	elsif (HoverCheck (140, 385, 210, 455, mouseX, mouseY) = true) then
	    GameStateLevel (1)
	elsif (HoverCheck (277, 385, 347, 455, mouseX, mouseY) = true) then
	    GameStateLevel (2)
	elsif (HoverCheck (414, 385, 484, 455, mouseX, mouseY) = true) then
	    GameStateLevel (3)
	elsif (HoverCheck (551, 385, 621, 455, mouseX, mouseY) = true) then
	    GameStateLevel (4)
	elsif (HoverCheck (688, 385, 758, 455, mouseX, mouseY) = true) then
	    GameStateLevel (5)
	elsif (HoverCheck (140, 236, 210, 306, mouseX, mouseY) = true) then
	    GameStateLevel (6)
	elsif (HoverCheck (277, 236, 347, 306, mouseX, mouseY) = true) then
	    GameStateLevel (7)
	elsif (HoverCheck (414, 236, 484, 306, mouseX, mouseY) = true) then
	    GameStateLevel (8)
	elsif (HoverCheck (551, 236, 621, 306, mouseX, mouseY) = true) then
	    GameStateLevel (9)
	elsif (HoverCheck (688, 236, 758, 306, mouseX, mouseY) = true) then
	    GameStateLevel (10)
	elsif (HoverCheck (140, 89, 210, 159, mouseX, mouseY) = true) then
	    GameStateLevel (11)
	elsif (HoverCheck (277, 89, 347, 159, mouseX, mouseY) = true) then
	    GameStateLevel (12)
	elsif (HoverCheck (414, 89, 484, 159, mouseX, mouseY) = true) then
	    GameStateLevel (13)
	elsif (HoverCheck (551, 89, 621, 159, mouseX, mouseY) = true) then
	    GameStateLevel (14)
	elsif (HoverCheck (688, 89, 758, 159, mouseX, mouseY) = true) then
	    GameStateLevel (15)
	else
	    buttonHover := NO_BUTTON
	end if
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y


    elsif (gameState = HELP) then
	if (HoverCheck (25, 550, 110, 590, mouseX, mouseY) = true) then
	    buttonHover := HELP_BACK_BUTTON
	    if mouseLeft = 1 then
		gameState := MENU
	    end if
	else
	    buttonHover := NO_BUTTON
	end if
    elsif (gameState = PAUSE) then

	if chars ('p') and not previouschars ('p') then
	    gameState := PLAY
	end if
	if (HoverCheck (400, 365, 500, 395, mouseX, mouseY) = true) then
	    buttonHover := PAUSE_SCREEN_MENU_HOVER
	    if mouseLeft = 1 then
		gameState := MENU
	    end if
	elsif (HoverCheck (410, 256, 490, 290, mouseX, mouseY) = true) then
	    buttonHover := PAUSE_SCREEN_HELP_HOVER
	    if mouseLeft = 1 then
		gameState := HELP
	    end if
	elsif (HoverCheck (310, 157, 590, 187, mouseX, mouseY) = true) then
	    buttonHover := PAUSE_SCREEN_RETURN_HOVER
	    if mouseLeft = 1 then
		gameState := PLAY
	    end if
	else
	    buttonHover := NO_BUTTON
	end if
    elsif (gameState = WIN) then
	Pic.Draw (winScreenPic, 0, 0, picUnderMerge)     %NEEDS TO BE DRAWN HERE SO THAT WHEN GAME WON IT DOESNT STAY AT LEVEL 15 PICTURE
	if (gameState = WIN) and (inputTrue = false) then %Used when the player inputs his or her name.
	    getch (letter)
	    if (length (name) <= 14) and not (letter = KEY_DOWN_ARROW) and not (letter = KEY_BACKSPACE) and not (letter = KEY_ENTER) then
		name := name + letter
	    elsif length (name) >= 1 and (letter = KEY_BACKSPACE) then
		name := name (1 .. * -1)
	    elsif length (name) > 1 and (letter = KEY_ENTER) then
		gameState := HIGHSCORE
		Pic.Draw (highScoreStillPic, 0, 0, picUnderMerge)
	    end if
	    inputTrue := true
	end if
    elsif (gameState = HIGHSCORE) then
	currentLevel := 1
	squareX := spawnPoints (currentLevel).x
	squareY := spawnPoints (currentLevel).y
	if (HoverCheck (25, 550, 110, 590, mouseX, mouseY) = true) then
	    buttonHover := HIGHSCORE_BACK_BUTTON
	    if (NewClick () = true) then
		gameState := MENU
	    end if
	else
	    buttonHover := NO_BUTTON
	end if
	if (mainGameDone = true) then
	    if (numOfDeath < highScoreScores (10)) then
		highScoreScores (10) := numOfDeath
		highScoreNames (10) := name
	    end if
	    for i : 1 .. 9 %bubble sort technique used here.
		for decreasing j : 9 .. i
		    if highScoreScores (j) > highScoreScores (j + 1) then %sees if the element below the high score is lower than the elemet above, if it is it swaps
			temp := highScoreScores (j)
			tempName := highScoreNames (j)
			highScoreScores (j) := highScoreScores (j + 1)
			highScoreNames (j) := highScoreNames (j + 1)
			highScoreScores (j + 1) := temp
			highScoreNames (j + 1) := tempName
		    end if
		end for
		put highScoreNames (i)
	    end for
	    Reset ()
	    SaveTopScores ()
	end if
    end if
    previouschars := chars

    prevMouseX := mouseX
    prevMouseY := mouseY
    prevButton := mouseLeft
    CheckIfWin ()
    CheckIfLost ()
end Update


procedure DrawObstacles ()
    if (currentLevel = 1) then
	for i : 1 .. upper (lvl1Obstacles)
	    Draw.FillOval (lvl1Obstacles (i).point.x, lvl1Obstacles (i).point.y, lvl1Obstacles (i).size, lvl1Obstacles (i).size, lvl1Obstacles (i).color)
	end for
    elsif (currentLevel = 2) then
	for i : 1 .. upper (lvl2Obstacles)
	    Draw.FillOval (lvl2Obstacles (i).point.x, lvl2Obstacles (i).point.y, lvl2Obstacles (i).size, lvl2Obstacles (i).size, lvl2Obstacles (i).color)
	end for
    elsif (currentLevel = 3) then
	for i : 1 .. upper (lvl3Obstacles)
	    Draw.FillOval (lvl3Obstacles (i).point.x, lvl3Obstacles (i).point.y, lvl3Obstacles (i).size, lvl3Obstacles (i).size, lvl3Obstacles (i).color)
	end for
    elsif (currentLevel = 4) then
	for i : 1 .. upper (lvl4Obstacles)
	    Draw.FillOval (lvl4Obstacles (i).point.x, lvl4Obstacles (i).point.y, lvl4Obstacles (i).size, lvl4Obstacles (i).size, lvl4Obstacles (i).color)
	end for
    elsif (currentLevel = 5) then
	for i : 1 .. upper (lvl5Obstacles)
	    Draw.FillOval (lvl5Obstacles (i).point.x, lvl5Obstacles (i).point.y, lvl5Obstacles (i).size, lvl5Obstacles (i).size, lvl5Obstacles (i).color)
	end for
    elsif (currentLevel = 6) then
	for i : 1 .. upper (lvl6Obstacles)
	    Draw.FillOval (lvl6Obstacles (i).point.x, lvl6Obstacles (i).point.y, lvl6Obstacles (i).size, lvl6Obstacles (i).size, lvl6Obstacles (i).color)
	end for
    elsif (currentLevel = 7) then
	for i : 1 .. upper (lvl7Obstacles)
	    Draw.FillOval (lvl7Obstacles (i).point.x, lvl7Obstacles (i).point.y, lvl7Obstacles (i).size, lvl7Obstacles (i).size, lvl7Obstacles (i).color)
	end for
    elsif (currentLevel = 8) then
	for i : 1 .. upper (lvl8Obstacles)
	    Draw.FillOval (lvl8Obstacles (i).point.x, lvl8Obstacles (i).point.y, lvl8Obstacles (i).size, lvl8Obstacles (i).size, lvl8Obstacles (i).color)
	end for
    elsif (currentLevel = 9) then
	for i : 1 .. upper (lvl9Obstacles)
	    Draw.FillOval (lvl9Obstacles (i).point.x, lvl9Obstacles (i).point.y, lvl9Obstacles (i).size, lvl9Obstacles (i).size, lvl9Obstacles (i).color)
	end for
    elsif (currentLevel = 10) then
	for i : 1 .. upper (lvl10Obstacles)
	    Draw.FillOval (lvl10Obstacles (i).point.x, lvl10Obstacles (i).point.y, lvl10Obstacles (i).size, lvl10Obstacles (i).size, lvl10Obstacles (i).color)
	end for
    elsif (currentLevel = 11) then
	for i : 1 .. upper (lvl11Obstacles)
	    Draw.FillOval (lvl11Obstacles (i).point.x, lvl11Obstacles (i).point.y, lvl11Obstacles (i).size, lvl11Obstacles (i).size, lvl11Obstacles (i).color)
	end for
    elsif (currentLevel = 12) then
	for i : 1 .. upper (lvl12Obstacles)
	    Draw.FillOval (lvl12Obstacles (i).point.x, lvl12Obstacles (i).point.y, lvl12Obstacles (i).size, lvl12Obstacles (i).size, lvl12Obstacles (i).color)
	end for
    elsif (currentLevel = 13) then
	for i : 1 .. upper (lvl13Obstacles)
	    Draw.FillOval (lvl13Obstacles (i).point.x, lvl13Obstacles (i).point.y, lvl13Obstacles (i).size, lvl13Obstacles (i).size, lvl13Obstacles (i).color)
	end for
    elsif (currentLevel = 14) then
	for i : 1 .. upper (lvl14Obstacles)
	    Draw.FillOval (lvl14Obstacles (i).point.x, lvl14Obstacles (i).point.y, lvl14Obstacles (i).size, lvl14Obstacles (i).size, lvl14Obstacles (i).color)
	end for
    elsif (currentLevel = 15) then
	for i : 1 .. upper (lvl15Obstacles)
	    Draw.FillOval (lvl15Obstacles (i).point.x, lvl15Obstacles (i).point.y, lvl15Obstacles (i).size, lvl15Obstacles (i).size, lvl15Obstacles (i).color)
	end for
    end if
    CheckIfLost ()
end DrawObstacles

%Pre:None
%Post: Draws game with the state the game is in.
%Description: Uses an if statement to check what state the game is in and draw according to it.
procedure DrawWorld ()
    if (gameState = MENU) then
	if (buttonHover = LVL_SEL_BUTTON) then
	    Pic.Draw (buttonLvlSel, 0, 0, picUnderMerge)
	    Pic.Draw (exitButton, 0, 0, picMerge)

	elsif (buttonHover = HELP_BUTTON) then
	    Pic.Draw (buttonHelp, 0, 0, picUnderMerge)
	    Pic.Draw (exitButton, 0, 0, picMerge)

	elsif (buttonHover = HIGHSCORE_BUTTON) then
	    Pic.Draw (buttonSettings, 0, 0, picUnderMerge)
	    Pic.Draw (exitButton, 0, 0, picMerge)

	elsif (buttonHover = PLAY_BUTTON) then
	    Pic.Draw (buttonPlay, 0, 0, picUnderMerge)
	    Pic.Draw (exitButton, 0, 0, picMerge)

	else
	    Pic.Draw (menuScreenStill, 0, 0, picUnderMerge)
	    if (buttonHover = EXIT_BUTTON) then
		Pic.Draw (exitButtonHover, 0, 0, picMerge)


	    else
		Pic.Draw (exitButton, 0, 0, picMerge)
	    end if

	end if
    elsif (gameState = PLAY) then
	%Obsticles are drawn when game is in PLAY state
	DrawObstacles ()

	%Draws the deaths and current level at the top of the screen in play state
	if (numOfDeath <= 999) then
	    Font.Draw ("DEATHS: " + intstr (numOfDeath), 600, 580, scoreFont, 16)
	else %If number of deaths is higher then 999 make it +999
	    Font.Draw ("DEATHS:+999", 600, 580, scoreFont, 16)
	end if
	Font.Draw ("Current Level: " + intstr (currentLevel), 468, 525, scoreFont, 16)

	%Draws the box (player)
	Draw.FillBox (squareX, squareY, (squareX + SIZE), (squareY + SIZE), red)

	%Hover Check for pause button in play state
	if (buttonHover = PAUSE_BUTTON) then
	    Pic.Draw (pauseButtonHoverPic, 10, 575, picMerge)
	else
	    Pic.Draw (pauseButtonStillPic, 10, 575, picMerge)
	end if

    elsif (gameState = LVL_SEL) then
	if (buttonHover = LVLSEL_BACK_BUTTON) then
	    Pic.Draw (LvlSelScreenBack, 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (1)) then
	    Pic.Draw (levelPicture (1), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (2)) then
	    Pic.Draw (levelPicture (2), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (3)) then
	    Pic.Draw (levelPicture (3), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (4)) then
	    Pic.Draw (levelPicture (4), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (5)) then
	    Pic.Draw (levelPicture (5), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (6)) then
	    Pic.Draw (levelPicture (6), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (7)) then
	    Pic.Draw (levelPicture (7), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (8)) then
	    Pic.Draw (levelPicture (8), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (9)) then
	    Pic.Draw (levelPicture (9), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (10)) then
	    Pic.Draw (levelPicture (10), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (11)) then
	    Pic.Draw (levelPicture (11), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (12)) then
	    Pic.Draw (levelPicture (12), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (13)) then
	    Pic.Draw (levelPicture (13), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (14)) then
	    Pic.Draw (levelPicture (14), 0, 0, picUnderMerge)
	elsif (buttonHover = LEVEL_NUM (15)) then
	    Pic.Draw (levelPicture (15), 0, 0, picUnderMerge)
	else
	    Pic.Draw (LvlSelScreen, 0, 0, picUnderMerge)
	end if
    elsif (gameState = HELP) then
	if (buttonHover = HELP_BACK_BUTTON) then
	    Pic.Draw (helpScreenBack, 0, 0, picMerge)
	else
	    Pic.Draw (helpScreen, 0, 0, picMerge)
	end if
    elsif (gameState = PAUSE) then
	if (buttonHover = PAUSE_SCREEN_MENU_HOVER) then
	    Pic.Draw (pauseScreenMenuPic, 0, 0, picUnderMerge)

	elsif (buttonHover = PAUSE_SCREEN_HELP_HOVER) then
	    Pic.Draw (pauseScreenHelpPic, 0, 0, picUnderMerge)
	elsif (buttonHover = PAUSE_SCREEN_RETURN_HOVER) then
	    Pic.Draw (pauseScreenReturnPic, 0, 0, picUnderMerge)
	else
	    Pic.Draw (pauseScreenStillPic, 0, 0, picUnderMerge)
	end if
    elsif (gameState = WIN) then
	if (inputTrue = true) then
	    Font.Draw (name, 400, 240, scoreFont, 16)
	    inputTrue := false
	end if
    elsif (gameState = HIGHSCORE) then
	if (buttonHover = HIGHSCORE_BACK_BUTTON) then

	    Pic.Draw (highScoreBackPic, 0, 0, picUnderMerge)
	else
	    Pic.Draw (highScoreStillPic, 0, 0, picUnderMerge)
	end if
	DrawHighScores ()

    end if
end DrawWorld

%Pre:None
%Post: Plays music and sound effects when needed
%Description: Uses an if statement to check if the
procedure PlaySounds ()
    if (playMusic = bgMusic (1) and (gameState = MENU)) then
	Music.PlayFileStop %if user was playing game and decided to go back to menu
	Music.PlayFileLoop ("menutheme.mp3")
	bgMusic (1) := true
	bgMusic (2) := false
    elsif (playMusic = bgMusic (2) and (gameState = PLAY)) then
	Music.PlayFileStop %stops any music before it
	Music.PlayFileLoop ("stagetheme.mp3")
	bgMusic (2) := true
	bgMusic (1) := false
    end if
    if hit = true then
	Music.PlayFileReturn ("losssound.wav")
	hit := false
    end if
    if nextLevel = true then
	Music.PlayFileReturn ("winsound.wav")
	nextLevel := false
    end if
end PlaySounds


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%               GAME LOGIC                %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Main Game Loop:
% 1. Clear the screen
% 2. Get user input
% 3. Update all items in the game
%   -Move itemsp
%   -update stats like scores, etc.
%   -etc.
% 4. Check for collisions
% 5. Redraw the screen
% 6. Play any sounds that need to be played
% 7. Delay the loop enough time to result in an fps of 16

ReadTopScores ()
SetupImages ()
SetSpawnForPlayer ()
loop    

    %1. Clear the screen
    cls

    %2. Get user input
    if (gameState = PLAY) or (gameState = PAUSE) then
	Input.KeyDown (chars)
    end if

    %3 + 4. Update all items in the game and check for collisions (inside update code)
    Update ()

    %5. Redraw the screen
    DrawWorld ()

    %6. Play any sounds
    PlaySounds ()

    %needed to make sure that you do not double click on a button
    prevMouseX := mouseX
    prevMouseY := mouseY
    prevButton := mouseButton

    View.Update ()

    delay (16)

    exit when isGameDone = true
end loop
%Free up all images used in game
for i : 1 .. 15
    Pic.Free (levels (i))
end for

for i : 1 .. 15
    Pic.Free (levelPicture (i))
end for

Pic.Free (menuScreenStill)
Pic.Free (buttonLvlSel)
Pic.Free (buttonHelp)
Pic.Free (buttonSettings)
Pic.Free (buttonPlay)
Pic.Free (helpScreen)
Pic.Free (helpScreenBack)
Pic.Free (LvlSelScreen)
Pic.Free (LvlSelScreenBack)
Pic.Free (exitButton)
Pic.Free (exitButtonHover)
Pic.Free (pauseScreenStillPic)
Pic.Free (pauseScreenMenuPic)
Pic.Free (pauseScreenHelpPic)
Pic.Free (pauseScreenReturnPic)
Pic.Free (pauseButtonStillPic)
Pic.Free (pauseButtonHoverPic)
Pic.Free (highScoreStillPic)
Pic.Free (highScoreBackPic)
Pic.Free (winScreenPic)

quit

