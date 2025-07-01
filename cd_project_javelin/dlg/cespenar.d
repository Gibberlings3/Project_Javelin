EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("cdjav3e")~ THEN GOTO PartyHasAtLeastOneItem
END

APPEND BOTSMITH
  IF ~~ THEN BEGIN PartyHasAtLeastOneItem SAY @1021
    IF ~~ THEN GOTO PartyDoesNotHaveAllParts
    IF ~NumItemsPartyGT("misc43",1)~ THEN GOTO PartyHasAllParts
  END

  IF ~~ THEN BEGIN PartyDoesNotHaveAllParts SAY @1022
   IF ~~ THEN GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN PartyHasAllParts SAY @1023
   IF ~PartyGoldLT(10000)~ THEN REPLY #66633 GOTO 10
   IF ~PartyGoldGT(9999)~ THEN DO ~SetGlobal("cdjav_upgrade","MYAREA",1)
                                   TakePartyGold(10000)
                                   DestroyGold(10000)
                                   TakePartyItem("cdjav3e")
                                   DestroyItem("cdjav3e")
                                   TakePartyItemNum("misc43",1)
                                   DestroyItem("misc43")
                                   TakePartyItemNum("misc43",1)
                                   DestroyItem("misc43")~ REPLY #66706 GOTO 11
   IF ~~ THEN REPLY #66650 GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN MovingRightAlong SAY @1024
   COPY_TRANS BOTSMITH 4
  END

  IF WEIGHT #-1 ~Global("cdjav_upgrade","MYAREA",1)~ THEN BEGIN ItemForged SAY #70888
    IF ~~ THEN DO ~SetGlobal("cdjav_upgrade","MYAREA",0)~ EXIT
  END

END 
