using {HeaderSrv as service} from '../service';

annotate service.Header with @odata.draft.enabled;

annotate service.Header with {
    HeaderID     @title: 'ID'          @Common.FieldControl: #ReadOnly;
    Email        @title: 'Email'       @Common.FieldControl: #Mandatory;
    Firstname    @title: 'First Name'  @Common.FieldControl: #Mandatory;
    Lastname     @title: 'Last Name'   @Common.FieldControl: #Mandatory;
    country      @title: 'Country'     @Common.FieldControl: #Mandatory;
    Creation     @title: 'Creation Date';
    Statu        @title: 'Status';
    Imageurl     @title: 'Image';
    Deliverydate @title: 'Delivery Date';

};

annotate service.Header with {
    Statu   @Common: {
        Text           : Statu.name,
        TextArrangement: #TextOnly
    };

    country @Common: {
        Text           : country.name,
        TextArrangement: #TextOnly
    };

};

annotate service.Header with @(

    UI.HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sale Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: HeaderID
        },
        // Description   : {
        //     $Type: 'UI.DataField',
        //     Value: Firstname
        // },
    },

    UI.SelectionFields           : [
        Firstname,
        Lastname,
        Creation,
        country_code,
        Statu_code
    ],

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type : 'UI.DataField',
            //     Label : 'HeaderID',
            //     Value : HeaderID,
            // },
            {
                $Type: 'UI.DataField',
                Value: Email,
            },
            {
                $Type: 'UI.DataField',
                Value: Firstname,
            },
            {
                $Type: 'UI.DataField',
                Value: Lastname,
            },
            {
                $Type: 'UI.DataField',
                Value: country_code,
            },
            {
                $Type: 'UI.DataField',
                Value: Creation,
            },
            {
                $Type: 'UI.DataField',
                Value: Deliverydate,
            },
            {
                $Type      : 'UI.DataField',
                Value      : Statu_code,
                Criticality: Statu.Criticality
            },
            {
                $Type: 'UI.DataField',
                Value: Imageurl,
            },
        ],
    },


    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'Header Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Target: 'toItems/@UI.LineItem',
            Label : 'Items',
            ID    : 'toItems'
        }
    ],

    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: HeaderID,
        },
        {
            $Type                : 'UI.DataField',
            Value                : Email,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },
        {
            $Type: 'UI.DataField',
            Value: Firstname,
        },
        {
            $Type: 'UI.DataField',
            Value: Lastname,
        },
        {
            $Type: 'UI.DataField',
            Value: country_code,
        },
        {
            $Type      : 'UI.DataField',
            Value      : Statu_code,
            Criticality: Statu.Criticality,
        },
    ],
);
