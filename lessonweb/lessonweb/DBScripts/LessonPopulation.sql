
truncate table STAGES;
truncate table LESSONS;
truncate table LESSONITEMS;
		
insert into STAGES (name, type, CertificationID) values ('STAGE I', 'FLIGHT', '61-PVT');

update STAGES SET OBJECTIVE='During this stage, the student becomes familiar with the training helicopter and learns how the helicopter controls are used to establish and maintain specific flight attitudes. The student also will gain proficiency to conduct the first supervised solo in the training helicopter.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='At the completion of this stage, the student will demonstrate proficiency in basic flight maneuvers, and will have successfully soloed in the local area.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 1 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Logbooks', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Certificates and Documents', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Equipment List', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Equipment and Survival Gear', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of First Aid Kit', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Fire Extinguisher', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Survival Gear', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Positive Exchange of Flight Controls', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbs', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Descents', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Level-Off', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-and-Level Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Banked Turns In Both', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Directions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Safety Precautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 2 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Logbooks', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Certificates and Documents', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Equipment List', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparations and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Helicopter Servicing', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Fuel Grades', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbing and Descending Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airspeed Transitions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Equipment and Survival Gear', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of First Aid Kit', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Fire Extinguisher', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Survival Gear', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Positive Exchange of Flight Controls', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbs', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Descents', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Level-Off', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-and-Level Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow and Medium Banked Turns In Both Directions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Safety Precautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 3 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Helicopter Servicing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Fuel Grades', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Positive Exchange of Flight Controls', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbing and Descending Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airspeed Transitions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoff to a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Stationary Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Landing From a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 4 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoff to a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Stationary Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Landing From a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crosswind Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crosswind Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 5 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbs', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Descents', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Level-Off', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-and-Level Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow, Medium, and Steep Banked Turns In Both Directions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbing and Descending Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Safety Precautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airspeed Transitions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crosswind Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crosswind Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Signals  Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 6 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '___ Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Simulated Forced Landing Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 7 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Simulated Forced Landing Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90° Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 8 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90° Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery (This task applies to a hover and in flight).', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 9 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical System Malfunction', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical Fire or Smoke', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hydraulic System Malfunction (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine and Components Malfunctions', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Antitorque Failure (This task applies to a hover and in flight).', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Train Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Abnormal Vibrations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '__ Warning Lights', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Tachometer Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Induction System Icing', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 10 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90°Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Simulated Forced Landing Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical System Malfunction', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical Fire or Smoke', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hydraulic System Malfunction (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine and Components Malfunctions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Antitorque Failure (This task applies to a hover and in flight).', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Train Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Abnormal Vibrations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Warning Lights', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Tachometer Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Induction System Icing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 11 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90°Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Simulated Forced Landing Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 12 DUAL AND SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Supervised Solo', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATCLight Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Stationary Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches  Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 13 DUAL — STAGE CHECK', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Certificates and Documents', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals  Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbing and Descending Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Level-Off', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-and-Level Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airspeed Transitions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Safety Precautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90° Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Simulated Forced Landing Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'After Landing and Securing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));

insert into STAGES (name, type, CertificationID) values ('STAGE II', 'FLIGHT', '61-PVT');

update STAGES SET OBJECTIVE='This stage allows the student to expand the skills learned in the previous stage. Introduction of maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations prepare the student for conducting flights at a variety of airports and heliports. Through discussion sessions, the student will gain insight into emergency situations including retreating blade stall, dynamic rollover, ground resonance, low G conditions, and low r.p.m. and blade stall.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='At the completion of this stage, the student will have the proficiency to safely demonstrate consistent results in performing maximum performance takeoffs and climbs, steep approaches, running/rolling takeoffs, shallow approaches, running/roll on landings, and slope operations. The student will exhibit knowledge of the elements related to retreating blade stall, dynamic rollover, ground resonance, low G conditions, low r.p.m. and blade stall, and can explain flight techniques which prevent these emergency situations.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 14 DUAL AND SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Supervised Solo', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Stationary Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 15 SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs,', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 16 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'As directed by the Instructor', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (Applies only to helicopters equipped with wheel-type landing gear)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 17 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Retreating Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dynamic Rollover (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 18 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Retreating Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dynamic Rollover (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Resonance (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low G Conditions (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM and Blade Stall Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 19 SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff andClimb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 20 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 21 SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 22 DUAL — STAGE CHECK', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Retreating Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dynamic Rollover (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Resonance (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low G Conditions (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM and Blade Stall', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));

insert into STAGES (name, type, CertificationID) values ('STAGE III', 'FLIGHT', '61-PVT');

update STAGES SET OBJECTIVE='During this stage, the student will learn to conduct cross-country flights using pilotage, dead reckoning, and radio navigation. In addition, the student will learn how to conduct night operations safely.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='This stage is complete when the student can accurately plan and conduct cross-country and night flights.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 23 DUAL — NIGHT', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Night Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Planning Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Physiological Aspects of Night Flying', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lighting and Equipment for Night Flying', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Landing Light', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 24 DUAL — CROSS-COUNTRY', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Sectional Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Publications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Route Selection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport or Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Approach and Departure Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled Airports/Heliports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of ATIS', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'CTAF (FSS or UNICOM) Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Departure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Opening Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Settings and Mixture Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Closing Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pilotage and Dead Reckoning', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Navigation and Radar Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Position Fixes', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Adverse Weather', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Diversion', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 25 SOLO — CROSS-COUNTRY', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Sectional Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Publications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Route Selection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport or Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Approach and Departure Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled Airports/Heliports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of ATIS', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'CTAF (FSS or UNICOM) Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Departure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Opening Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Settings and Mixture Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Closing Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pilotage and Dead Reckoning', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Navigation and Radar Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Position Fixes', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Adverse Weather', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Diversion', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 26 DUAL — NIGHT CROSS-COUNTRY', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Sectional Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Publications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Route Selection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport or Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Approach and Departure Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled Airports/Heliports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of ATIS', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'CTAF (FSS or UNICOM) Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Night Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Planning Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Physiological Aspects of Night Flying', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lighting and Equipment for Night Flying', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs,Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Landing Light', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Departure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Opening Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Settings and Mixture Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Closing Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pilotage and Dead Reckoning', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Navigation and Radar Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Position Fixes', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Adverse Weather', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Diversion', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 27 DUAL — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Logbooks', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Certificates and Documents', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Equipment List', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Equipment and Survival Gear', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '__ Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);


					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Safety Precautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-In Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '90° Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Partial Power Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Retreating Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dynamic Rollover (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Resonance (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low G Conditions (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM and Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 28 and 29 SOLO — LOCAL', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation and Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 30 DUAL — STAGE CHECK', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Sectional Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Publications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Route Selection', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport or Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Approach and Departure Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled Airports/Heliports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of ATIS', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'CTAF (FSS or UNICOM) Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Departure', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Opening Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Settings and Mixture Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Communications', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Closing Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pilotage and Dead Reckoning', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Navigation and Radar Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Position Fixes', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Adverse Weather', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Diversion', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=1, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('FLIGHT 31 DUAL — END-OF-COURSE CHECK', (select MAX(STAGEID) from STAGES));

					
					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Preparation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Logbooks', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Certificates and Documents', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Equipment List', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Equipment and Survival Gear', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of First Aid Kit', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Fire Extinguisher', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Survival Gear', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs, Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operation of Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Equipment List', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Equipment and Survival Gear', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of First Aid Kit', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Fire Extinguisher', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Location of Survival Gear', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight Planning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Information', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Log', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance and Limitations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'National Airspace System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeromedical Factors', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Crew Resource Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Inspection', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine Starting and Rotor Engagement', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Before Takeoff Check', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Communications and ATC Light Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Pattern', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Markings and Lighting', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Runway Incursion Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Maneuvers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vertical Takeoffs and Landings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward, Rearward, and Sideward Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering Turns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Taxi (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hover Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Air Taxi', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Slope Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Piloting Skills', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Use of Checklists', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rapid Deceleration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Wind Shear Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collision Avoidance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Takeoffs, Landings, and Go-Arounds', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Normal and Crosswind Takeoffs Climbs, and Approaches', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Maximum Performance Takeoff and Climb', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Steep Approach', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Rolling Takeoff (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Running Takeoff', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Shallow Approach and Running/Roll-On Landing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Go-Around', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Operations', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Straight-in Autorotation With Power Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at a Hover', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Failure at Altitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Settling-With-Power', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM Recovery', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Retreating Blade Stall (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dynamic Rollover (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Resonance (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low G Conditions (Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Rotor RPM and Blade Stall(Discussion Only)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Systems and Equipment Malfunctions', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical System Malfunction', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical Fire or Smoke', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hydraulic System Malfunction (If Applicable)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Engine and Components Malfunctions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Antitorque Failure (This task applies to a hover and in flight).', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Power Train Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Abnormal Vibrations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Warning Lights', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Tachometer Failure', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Induction System Icing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cross-Country Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Postflight Procedures', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=1 where LineID=(select Max(LineID) from LessonItems);

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));

insert into STAGES (name, type, CertificationID) values ('STAGE I', 'GROUND', '61-PVT');

update STAGES SET OBJECTIVE='During this stage, the student will be introduced to helicopters and become familiar with the aerodynamic principles of flight which affect their operation. The student will also obtain a basic knowledge of the safety of flight, airports and heliports, airspace, radio communications, and air traffic control services, including the use of radar. In addition, the student will learn how to predict performance and control weight and balance conditions of the helicopter. The student also will become familiar with the Federal Aviation Regulations as they apply to private pilot operations. Finally, the student will be introduced to meteorology for pilots.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='This stage is complete when the student has taken the Stage I written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage II.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 1', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Introduction to the Helicopter', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Main Rotor System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Antitorque Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Landing Gear', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Powerplant', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Certification', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Aerodynamic Forces', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lift', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Drag', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Thrust', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lift Equation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Forces in Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hovering', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ground Effect', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Forward Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Autorotation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Three Axes', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Turning Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 2', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Flight Control Systems', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Collective Pitch', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cyclic Pitch', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Swash Plate Assembly', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Antitorque Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Trim Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Friction Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'RPM and Manifold Pressure Instruments', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - The Reciprocating Engine and Related Systems', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Principles of Operation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Ignition System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Oil System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cooling the Engine', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Turboshaft Engines', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Fuel and Electrical Systems', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Fuel Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Fuel Supply System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Induction System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Refueling', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electrical Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section D - Power Train Systems', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Clutch', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Transmission', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Tail Rotor Drive System', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Freewheeling Unit', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section E - Flight Instruments', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Magnetic Compass', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Outside Air Temperature Gauge', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pitot-Static Instruments', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Gyroscopic Flight Instruments', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 3', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Safety of Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Visual Scanning', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Blind Spots and Aircraft Design', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Right-Of-Way Rules', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Minimum Safe Altitudes', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VFR Cruising Altitudes', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Special Safety Considerations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Airports and Heliports', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled and Uncontrolled Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Traffic Patterns', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Basic Runway Markings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Heliports', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Taxiways', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport and Heliport Aids', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Noise Abatement Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Airspace', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Controlled Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class A Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class B Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class C Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class D Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class E Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cloud Clearance and Visibility Requirements', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Class G Airspace (Uncontrolled)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Special Use Airspace', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Other Airspace Areas', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Air Traffic Rules', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'ADIZ', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 4', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Radio Communications', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VHF Communications Equipment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Coordinated Universal Time', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Using the Radio', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radio Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Common Traffic Advisory Frequency', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Service Stations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Radar and ATC Services', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radar', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Transponder', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAA Radar Systems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VFR Radar Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'ATC Facilities at Controlled Airports', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Lost Communications Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Emergency Procedures', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Predicting Performance', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Factors Affecting Performance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Pilot’s Operating Handbook', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Performance Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Operating Limitations and Markings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section D - Weight and Balance', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Weight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aircraft Balance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance Control', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weight and Balance Calculation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 5', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '14 CFR Part 1', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '14 CFR Part 61', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), '14 CFR Part 91', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'NTSB Part 830', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 6', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Basic Weather Theory', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Atmosphere', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Atmospheric Circulation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wind', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Moisture', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Change of State', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Humidity', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Weather Patterns', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Atmospheric Stability', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Clouds', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airmasses', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Fronts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Weather Hazards”', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Thunderstorms', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Turbulence', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wind Shear', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Wake Turbulence', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low Visibility', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Icing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cold Weather Operations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 7 STAGE I EXAM', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Principles of Flight', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Helicopter Systems and Instruments', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Flight Environment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Communications and Performance', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Meteorology For Pilots”', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'FAR/AIM — Private Pilot Regulations', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));

insert into STAGES (name, type, CertificationID) values ('STAGE II', 'GROUND', '61-PVT');

update STAGES SET OBJECTIVE='During this stage, the student will build on previous weather knowledge to learn how to procure weather information and interpret printed reports and graphic weather products. In addition, the student will learn about aeronautical charts, flight computers, pilotage, dead reckoning, and flight information sources. The student also will be introduced to VOR, ADF, and advanced navigation, including GPS.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='This stage is complete when the student has taken the Stage II written exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding before the student progresses to Stage III.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 8', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Printed Reports and Forecasts', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aviation Routine Weather Reports(METAR)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Additional Reports', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Terminal Aerodrome Forecasts (TAF)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Area Forecasts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Winds and Temperatures Aloft Forecasts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Severe Weather Reports and Forecasts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Graphic Weather Products', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Surface Analysis Chart', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Weather Depiction Chart', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Radar Summary Chart', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Low-Level Significant Weather Prog', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Sources of Weather Information', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Preflight Weather Briefings', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Supplemental Weather Sources', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'In-Flight Weather Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 9', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Aeronautical Charts', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Sectional Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VFR Terminal Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'World Aeronautical Charts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Latitude and Longitude', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Legend', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Flight Computers', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Navigation Theory', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Mechanical Flight Computers', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Electronic Flight Computers', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Multi-Part Problems', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Conversions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Pilotage and Dead Reckoning', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pilotage', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Dead Reckoning', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Plan', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flying Over Hazardous Terrain', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section D - Sources of Flight Information', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Airport/Facility Directory', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aeronautical Information Manual', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Notices to Airmen', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Advisory Circulars', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Jeppesen Pilot Resource Services', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 10', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - VHF Omnidirectional Range', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Principles of Operation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VOR Airborne Equipment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VOR Navigation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Using VOR Navigation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VOR Cautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VOR Test Signals', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Classes of VOR Facilities', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Distance Measuring Equipment (DME)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Automatic Direction Finder', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'ADF Equipment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Homing', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Tracking', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'ADF Intercepts', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Movable-Card Indicators', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'ADF Cautions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Advanced Navigation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'VORTAC-Based RNAV', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Long Range Navigation (LORAN)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Global Positioning System (GPS)', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Advanced Navigation Indicators', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 11 STAGE II EXAM', (select MAX(STAGEID) from STAGES));

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));

insert into STAGES (name, type, CertificationID) values ('STAGE III', 'GROUND', '61-PVT');

update STAGES SET OBJECTIVE='During this stage, the student will gain an understanding of the physiological factors which can affect both pilot and passengers during flight. In addition, the student will learn how to conduct comprehensive preflight planning for cross-country flights and gain insight into factors affecting the decision-making process.' where STAGEID=(select MAX(STAGEID) from STAGES);
update STAGES SET STANDARD='This stage is complete when the student has taken the Stage III written exam and the Private Pilot Helicopter Final Exam with a minimum passing score of 80%, and the instructor has reviewed each incorrect response to ensure complete understanding.' where STAGEID=(select MAX(STAGEID) from STAGES);

INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 12', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Vision in Flight', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Eye', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Night Vision', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Night Scanning', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Visual Illusions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Landing Illusions', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Spatial Disorientation', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Visual Sense', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Vestibular Sense', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Kinesthetic Sense', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Disorientation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Motion Sickness', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Respiration and Altitude', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Respiration', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hypoxia', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Supplemental Oxygen', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hyperventilation', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pressure Effects', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section D - Alcohol, Drugs, and Performance', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Depressants', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Alcohol', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Stimulants', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Pain Killers', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Other Problem Drugs', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 13', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section A - Planning and Organizing Flights', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Initial Planning', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Final Planning Stage', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Cockpit Management', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section B - Factors Affecting Decision Making', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'The Decision-Making Process', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Hazardous Attitudes', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Risk Assessment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Self Assessment', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Section C - Cockpit Resource Management', 0, 0, 0);

update LESSONITEMS Set IsGroup=1 where LineID=(select Max(LineID) from LessonItems);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Primary Resources', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Expanding Your Resources', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 14 STAGE III EXAM', (select MAX(STAGEID) from STAGES));

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Aviation Physiology', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

					
INSERT INTO LESSONITEMS (LESSONID, STAGEID, ItemName, IsGroup, IsReview, IsIntro) values ((select MAX(LESSONID) from LESSONS), (select MAX(STAGEID) from STAGES), 'Flight Planning and Decision Making', 0, 0, 0);

update LESSONITEMS SET IsIntro=0, IsReview=0 where LineID=(select Max(LineID) from LessonItems);

				
INSERT INTO LESSONS (TITLE, STAGEID) values ('GROUND LESSON 15 END-OF-COURSE EXAM — PRIVATE PILOT HELICOPTER', (select MAX(STAGEID) from STAGES));

				
update  lessonitems set LESSONGUID = CONCAT(Convert(varchar, StageID), ':', Convert(varchar, LessonID),':', Convert(varchar, lineid));
