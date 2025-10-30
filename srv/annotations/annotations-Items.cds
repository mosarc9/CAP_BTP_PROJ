using {HeaderSrv as service} from '../service';

annotate service.Items with {

    ItemsID          @title: 'Item'          @Common.FieldControl: #ReadOnly;
    Name             @title: 'Name'          @Common.FieldControl: #Mandatory;
    Description      @title: 'Description'   @Common.FieldControl: #Mandatory;
    Releasedate      @title: 'Release Date'  @Common.FieldControl: #Mandatory;
    Discontinueddate @title: 'Discontinued Date';
    Price            @title: 'Price';
    Height           @title: 'Hight';
    Width            @title: 'Width';
    Depth            @title: 'Depth';
    Quantity         @title: 'Quantity'      @Common.FieldControl: #Mandatory  @Measures.Unit: Unitofmeasure;
    Unitofmeasure    @title: 'Unit of Measure';
};

annotate service.Items with @(

    UI.HeaderInfo            : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: ItemsID
        },
    // Description   : {
    //     $Type: 'UI.DataField',
    //     Value: Description
    // },
    },

    UI.SelectionFields       : [
        Name,
        Description,
        Releasedate
    ],

    UI.FieldGroup #ItemsGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Name,
            },
            {
                $Type: 'UI.DataField',
                Value: Description,
            },
            {
                $Type: 'UI.DataField',
                Value: Releasedate,
            },
            {
                $Type: 'UI.DataField',
                Value: Discontinueddate,
            },
            {
                $Type: 'UI.DataField',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Value: Quantity,
            },
        ],
    },

    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ItemsGroup',
            Label : 'Items',
            Target: '@UI.FieldGroup#ItemsGroup',
        }
    ],

    UI.LineItem              : [
        {
            $Type: 'UI.DataField',
            Value: ItemsID
        },

        {
            $Type                : 'UI.DataField',
            Value                : Name,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },

        {
            $Type                : 'UI.DataField',
            Value                : Description,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem'
            },
        },

        {
            $Type: 'UI.DataField',
            Value: Releasedate
        },

        {
            $Type: 'UI.DataField',
            Value: Discontinueddate
        },

        {
            $Type: 'UI.DataField',
            Value: Price
        },

        {
            $Type                : 'UI.DataField',
            Value                : Height,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem'
            },
        },

        {
            $Type                : 'UI.DataField',
            Value                : Width,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem'
            },
        },

        {
            $Type                : 'UI.DataField',
            Value                : Depth,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem'
            },
        },

        {
            $Type                : 'UI.DataField',
            Value                : Quantity,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem'
            },
        },

        // {
        //     $Type                : 'UI.DataField',
        //     Value                : Unitofmeasure,
        //     ![@HTML5.CssDefaults]: {
        //         $Type: 'HTML5.CssDefaultsType',
        //         width: '10rem'
        //     },
        // },
    ]
)
