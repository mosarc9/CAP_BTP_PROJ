using {HeaderSrv as service} from '../service';

annotate service.Items with {

    ItemsID          @title: 'ID';
    Name             @title: 'Name';
    Description      @title: 'Description';
    Releasedate      @title: 'Release Date';
    Discontinueddate @title: 'Discontinued Date';
    Price            @title: 'Price';
    Height           @title: 'Hight';
    Width            @title: 'Width';
    Depth            @title: 'Depth';
    Quantity         @title: 'Quantity';
    Unitofmeasure    @title: 'Unit of Measure';
};

annotate service.Items with @(
    
        UI.HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: Name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        },
    },

    UI.SelectionFields:[
        Name,
        Description,
        Releasedate
    ],
    
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: ItemsID
    },

    {
        $Type: 'UI.DataField',
        Value: Name,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '15rem'
        },
    },

    {
        $Type: 'UI.DataField',
        Value: Description,
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
        $Type: 'UI.DataField',
        Value: Height,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '7rem'
        },
    },

    {
        $Type: 'UI.DataField',
        Value: Width,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '7rem'
        },
    },

    {
        $Type: 'UI.DataField',
        Value: Depth,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '7rem'
        },
    },

    {
        $Type: 'UI.DataField',
        Value: Quantity,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '7rem'
        },
    },

    {
        $Type: 'UI.DataField',
        Value: Unitofmeasure,
        ![@HTML5.CssDefaults]: {
            $Type: 'HTML5.CssDefaultsType',
            width: '10rem'
        },
    },
])