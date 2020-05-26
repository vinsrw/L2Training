mysql> SELECT iCounterID from gen_Counter WHERE cCountername='booking_counter' limit 1;

select CounterID from gen_Counter with cCountername = booking_counter // res=1
 
INSERT INTO gen_User SET cUsername ='edi_bestbus_prod' , cCompanyname='Best bus service' ,cType='C',cUserApptype='WE',cPassword = sha1('Xjakssdjksduiweuwer') ,iCounterID=@icounter,tEntered=now();
 
INSERT data into gen_User table. with username , company name and iCounterID.
 
SET @iUserID=(SELECT iUserID FROM gen_User WHERE cUsername ='edi_bestbus_prod' limit  1);

After inserting data into the gen_User table we find userID of that customer = edi_bestbus_prod

INSERT INTO sei_Member SET iUserID=@iUserID,cCompanycode='edi_bestbus_prod', cCompanyname='Best bus services' , tEntered=now();

INSERT data into sei_Member table with UserID,CompanyCode and companyName.

SET @iMemberID=(SELECT iMemberID FROM sei_Member WHERE cCompanycode='edi_bestbus_prod'  limit 1);

After inserting data into sei_Member table we find MemberID of that customer = edi_bestbus_prod.

SET @iProgramID_BKG = (SELECT iProgramID FROM gen_Program WHERE cCode = 'BKG');
mysql> SELECT iProgramID FROM gen_Program WHERE cCode = 'BKG'; // 7

Now we find programID from gen_Program table with cCode = BKG 

INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BKG, iMemberID = @iMemberID, tEntered = now(), cCode = 'PortalTransfer', cValue = 'Y', iStatus = 0;

Inserting the data into sei_Member_setting table with programID,MemberID and cCode.

INSERT INTO sei_Member_transfer SET iMemberID = @iMemberID, cTransfertype='DIR', cUsername='edi_bestbus_prod', tEntered=now();


Now find SET @iMembertransferID= (SELECT iMembertransferID FROM sei_Member_transfer WHERE iMemberID=@iMemberID and cTransfertype='DIR' and istatus=0 limit 1);
find MemnerTransferID which contains memberID and Transfertype.

INSERT INTO sei_Member_transfer_program_link set  iMembertransferID=@iMembertransferID,iProgramID=@iProgramID_BKG,cMessageformat='XML',cFilenameformat='WWA.CARGOWISE.BOOK.ACK.{{CustomerReference}}.{{YYYYMMDD}}

{{HHMMSS}}.xml',cDestination='/home/edi_cargowise_prod/download/booking_aperak/',tEntered=now();
INSERT data into sei_Member_transfer_program_link with MemberTransferID,ProgramID,MessageFormat,Filenameformat

SET @iProgramID_CNV=(SELECT iProgramID FROM gen_Program WHERE cCode = 'CNV');
mysql> SELECT iProgramID FROM gen_Program WHERE cCode = 'CNV'; //38

FInd programID from gen_Program with condition cCode='CNV' 


INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_CNV, iMemberID = @iMemberID, tEntered = now(), cCode = 'envelope_password', cValue = 'Xjakssdjksduiweuwer' ,iStatus = 0 ;

INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_CNV, iMemberID = @iMemberID, tEntered = now(), cCode = 'edi_bestbus_prod', cValue = 'edi_bestbus_prod',  iStatus=0 ;

INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_CNV, iMemberID = @iMemberID, tEntered = now(), cCode = 'portal_processdir', cValue = 'Y', iStatus = 0;

Inserting data into sei_Member_setting table 

find iProgramID FROM gen_Program with condition cCode = 'BKC'; // 62
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BKC, iMemberID = @iMemberID, cCode = 'from_portal', cValue = 'Y', iStatus = 0, tEntered = now();
INSERT INTO sei_Office_map  SET iMemberID = @iMemberID, cExternalcode = 'edi_usbus_prod' , tEntered=now();

find iProgramID FROM gen_Program with condition cCode = 'BOL'; // 18
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'acknowledge_xml', cValue = 'Y', iStatus = 0;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'wwa_format', cValue = 'Y', iStatus = 0;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'Notificationperiod', cValue = '7', iStatus = 0;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'cReminderEmail', cValue = 'N', iStatus = 0;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'cReprocessBL', cValue = 'Y', iStatus = 0;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'add_communication_ref', cValue = 'Y', iStatus = 0;

INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_BOL, iMemberID = @iMemberID, tEntered = now(), cCode = 'ReceiverID', cValue = 'edi_cargowise_prod', iStatus = 0;

find iProgramID FROM gen_Program with condition cCode = 'OBL';// 24

INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_OBL, iMemberID = @iMemberID, tEntered = now(), cCode = 'envelope_password', cValue = 'Xjakssdjksduiweuwer' , iStatus=0 ;
INSERT INTO sei_Member_setting SET iProgramID = @iProgramID_OBL, iMemberID = @iMemberID, tEntered = now(), cCode = 'edi_usbus_prod' , cValue='edi_usbus_prod' , iStatus=0;

SET @iMembertransferID= (SELECT iMembertransferID FROM sei_Member_transfer WHERE iMemberID=@iMemberID and cTransfertype='DIR' and istatus=0 limit 1);
INSERT INTO sei_Member_transfer_program_link SET  iMembertransferID=@iMembertransferID,iProgramID=@iProgramID_BOL,cMessageformat='XML',cAckfilenameformat='WWA.CARGOWISE.BL.ACK.{{CustomerReference}}.{{YYYYMMDD}}.{{HHMMSS}}.xml',cAckdestination='/home/edi_cargowise_prod/download/bl_aperak/',tEntered=now();











