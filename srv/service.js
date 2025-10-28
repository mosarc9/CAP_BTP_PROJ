const cds = require('@sap/cds');

module.exports = class HeaderSrv extends cds.ApplicationService {

    async init() {

        const { Header, Items } = this.entities;

        this.before('NEW', Header.drafts, async (req) => {
            let tp = await SELECT.one.from(Header).columns('max(stockNumber) as Max');
            let td = await SELECT.one.from(Header.drafts).columns('max(stockNumber) as Max');

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

        return super.init();
    }
}