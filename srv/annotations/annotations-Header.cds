using {HeaderSrv as service} from '../service';

annotate service.Header with @odata.draft.enabled;


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
        Description   : {
            $Type: 'UI.DataField',
            Value: Firstname
        },
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
                Label: 'Email',
                Value: Email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Firstname',
                Value: Firstname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Lastname',
                Value: Lastname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: country_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Creation',
                Value: Creation,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Deliverydate',
                Value: Deliverydate,
            },
            {
                $Type      : 'UI.DataField',
                Label      : 'Status',
                Value      : Statu_code,
                Criticality: Statu.Criticality
            },
            {
                $Type: 'UI.DataField',
                Label: 'Imageurl',
                Value: Imageurl,
            },
        ],
    },


    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
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
            Label: 'HeaderID',
            Value: HeaderID,
        },
        {
            $Type                : 'UI.DataField',
            Label                : 'Email',
            Value                : Email,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },
        {
            $Type: 'UI.DataField',
            Label: 'Firstname',
            Value: Firstname,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Lastname',
            Value: Lastname,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: country_code,
        },
        {
            $Type      : 'UI.DataField',
            Label      : 'Status',
            Value      : Statu_code,
            Criticality: Statu.Criticality,
        },
    ],
);
