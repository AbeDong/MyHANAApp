using app.interactions from '../db/interactions';
using V_INTERACTION from '../db/interactions';

/* @requires: 'authenticated-user'  */
service CatalogService {

    entity Interactions_Header
        as projection on interactions.Interactions_Header;

    entity Interactions_Items
        as projection on  interactions.Interactions_Items;


    function sleep() returns Boolean;

    action POST_HEADER_API(ID : Integer, data : many Interactions_Header) returns array of Interactions_Header;

    @read_only
    entity V_Interaction 
        as projection on V_INTERACTION;
}
