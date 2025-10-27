namespace com.logali;

using {
    cuid,
    managed,
    Country,
    sap.common.CodeList
} from '@sap/cds/common';


entity Header : cuid, managed {
    HeaderID     : Integer;
    Email        : String;
    Firstname    : String;
    Lastname     : String;
    country      : Country;
    Creation     : Date;
    Deliverydate : DateTime;
    Statu        : Association to Status; // Statu Status_code
    Imageurl     : String;
    toItems      : Composition of many Items
                       on toItems.HeaderID = $self;

};

entity Items : cuid {
    ItemsID          : Integer;
    HeaderID         : Association to Header;
    Name             : String;
    Description      : String;
    Releasedate      : Date;
    Discontinueddate : Date;
    Price            : Decimal(12, 2);
    Height           : Decimal(15, 2);
    Width            : Decimal(12, 2);
    Depth            : Decimal(12, 2);
    Quantity         : Decimal(13, 3);
    Unitofmeasure    : String;
}

//Value Help
//entity Countries : cuid {
//   country : String(50);
//}


//Code List

//1: rojo
//2: amarillo
//3: verde
entity Status : CodeList {
    key code        : String(15) enum {
            O = 'Open';
            A = 'Acepted';
            X = 'Rejected';
        };
        Criticality : Int16;
}

// entity selCustomers as
//     select from Header {
//         Firstname,
//         Lastname
//     }