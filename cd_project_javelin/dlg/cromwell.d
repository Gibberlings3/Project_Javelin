APPEND WSMITH01

  IF WEIGHT #-1 ~GlobalGT("cdjav_upgrade","MYAREA",0)~ THEN BEGIN cd_cromwell_upgrade_done SAY #59797
    IF ~~ THEN DO ~SetGlobal("cdjav_upgrade","MYAREA",0)~ EXIT
  END

  IF ~~ THEN BEGIN PartyHasAtLeastOneItem SAY @1073
    IF ~~ THEN GOTO PartyDoesNotHaveAllParts
    IF ~NumItemsPartyGT("misc43",1)~ THEN GOTO PartyHasAllParts
  END

  IF ~~ THEN BEGIN PartyDoesNotHaveAllParts SAY @1074
    IF ~~ THEN GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN PartyHasAllParts SAY @1075
    IF ~~ THEN REPLY @1077 GOTO HowMuch
    IF ~~ THEN REPLY @1078 GOTO MovingRightAlong
  END

  IF ~~ THEN BEGIN HowMuch SAY @1076
    IF ~PartyGoldGT(9999)~ THEN DO ~SetGlobal("cdjav_upgrade","MYAREA",1)
                                    TakePartyGold(10000)
                                    DestroyGold(10000)
                                    TakePartyItem("cdjav3e")
                                    DestroyItem("cdjav3e")
                                    TakePartyItemNum("misc43",1)
                                    DestroyItem("misc43")
                                    TakePartyItemNum("misc43",1)
                                    DestroyItem("misc43")~ REPLY @1080 GOTO 56
    IF ~~ THEN REPLY @1078 GOTO MovingRightAlong
    IF ~~ THEN REPLY @1079 GOTO 12
  END

  IF ~~ THEN BEGIN MovingRightAlong SAY @1081
    COPY_TRANS WSMITH01 13
  END

END

EXTEND_BOTTOM WSMITH01 13

  IF ~PartyHasItem("cdjav3e")~ THEN GOTO PartyHasAtLeastOneItem

END
