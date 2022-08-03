//namespace app.interactions;

using { Country, managed } from '@sap/cds/common';

context app.interactions{

type BussinessKey : String(10);
type SDate : DateTime;
type LText : String(1024);

entity Interactions_Header {
    Key ID : Integer;
    ITEMS :Composition of many Interactions_Items on ITEMS.INTHeader = $self;
    PARTNER : BussinessKey;
    LOG_DATE : SDate @title : 'Log Date';
    BPCOUNTRY : Country @title : 'Business Partner Country';    
}

entity Interactions_Items {
    key INTHeader : Association to Interactions_Header;
    key TEXT_ID : BussinessKey;
        LANGU  : String(2);
        LOGTEXT : LText;
}
}

@cds.persistence.exists 
@cds.persistence.calcview
Entity ![V_INTERACTION] {
key     ![ID]: Integer  @title: 'ID: ID' ; 
key     ![PARTNER]: String(10)  @title: 'PARTNER: PARTNER' ; 
key     ![LOG_DATE]: String  @title: 'LOG_DATE: LOG_DATE' ; 
key     ![BPCOUNTRY_CODE]: String(3)  @title: 'BPCOUNTRY_CODE: BPCOUNTRY_CODE' ; 
key     ![TEXT_ID]: String(10)  @title: 'TEXT_ID: TEXT_ID' ; 
key     ![LANGU]: String(2)  @title: 'LANGU: LANGU' ; 
key     ![LOGTEXT]: String(1024)  @title: 'LOGTEXT: LOGTEXT' ; 
}