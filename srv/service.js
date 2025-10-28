const cds = require('@sap/cds');

module.exports = class HeaderSrv extends cds.ApplicationService {

    async init() {

        const { Header, Items } = this.entities;

        this.before('NEW', Header.drafts, async (req) => {
            let tp = await SELECT.one.from(Header).columns('max(HeaderID) as Max');
            let td = await SELECT.one.from(Header.drafts).columns('max(HeaderID) as Max');

            let tpMax = tp.Max;
            let tdMax = td.Max;
            let newMax = 0;


            if (isNaN(tdMax)) {
                newMax = tpMax + 1;
            } else if (tpMax < tdMax) {
                newMax = tdMax + 1;
            } else {
                newMax = tpMax + 1;
            }

            req.data.HeaderID = newMax;

        }
        );

        

        this.before('NEW', Items.drafts, async (req) => {
            const headerId = req.data.HeaderID_ID;
            console.log("XXXXXXXXXXXXXX", headerId);
            let tp2 = await SELECT.one.from(Items).columns('max(ItemsID) as Max2').where({HeaderID: headerId});
            let td2 = await SELECT.one.from(Items.drafts).columns('max(ItemsID) as Max2').where({HeaderID: headerId});

            let tpMax2 = tp2.Max2;
            let tdMax2 = td2.Max2;
            let newMax2 = 0;


            if (isNaN(tdMax2)) {
                newMax2 = tpMax2 + 1;
            } else if (tpMax2 < tdMax2) {
                newMax2 = tdMax2 + 1;
            } else {
                newMax2 = tpMax2 + 1;
            }

            req.data.ItemsID = newMax2;

        }
        );

        return super.init();
    }
}