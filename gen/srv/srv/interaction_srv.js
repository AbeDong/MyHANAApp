const cds = require("@sap/cds");

module.exports = cds.service.impl(function(){
    this.on('POST_HEADER_API', async (req) =>{
        try{
            console.log(req.data);
            return req.data["data"];
        }
        catch(error){
            console.log(error)
        }
    }
    );

    this.on('sleep', async(req) =>{
        try {
            const dbClass = require("sap-hdb-promisfied")
            let dbConn = new dbClass(await dbClass.createConnectionFromEnv())
            const sp = await dbConn.loadProcedurePromisified(null, '"sleep"')
            console.log(sp)
            const output = await dbConn.callProcedurePromisified(sp, [])
            console.log(output.results)
            return true
        } catch (error) {
            console.error(error)
            return false
        }
    })
}

)