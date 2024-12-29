const express = require("express");
const cors = require("cors");  // Import the CORS package
const app = express();

// Allow all origins
app.use(cors({
    origin: '*',  // This allows requests from any origin
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type']
}));

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

const personData = [];
const port = 3000;

app.listen(port, () => {
    console.log(`Successfully connected to ${port}`);
});

// POST API to add person data
app.post("/api/add_person", (req, res) => {
    console.log("Request body:", req.body);
    const pdata = {
        "id": personData.length + 1,
        "pname": req.body.pname,
        "pphone": req.body.pphone,
        "pAge": req.body.pAge,
        "pgmail": req.body.pgmail
    };
    personData.push(pdata);
    console.log("Final result:", pdata);

    res.status(200).send({
        "Status_code": 200,
        "Message": "Person data is added successfully",
        "person": pdata
    });
});


app.get("/api/get_person",(req,res)=>
    {
if(personData.length>0){
    res.status(200).send({
        'status_code':200,
        'person':personData
    });
}else{
    res.status(200).send({
        'status_code':200,
        'person':[]
    });
}
    });

    //update api 
    app.put("/api/update/:id", (req, res) => {
        let id = req.params.id;
        console.log(`Received update request for ID: ${id}, Data: `, req.body); // Log the incoming request
      
        let updatedPersonData = req.body;
        let person = personData.find(p => p.id === id);
      
        if (!person) {
          return res.status(404).send({ message: "Person not found" });
        }
      
        person.name = updatedPersonData.pname;
        person.phone = updatedPersonData.pphone;
        person.age = updatedPersonData.pAge;
        person.email = updatedPersonData.pgmail;
      
        res.status(200).send({
          status_code: 200,
          message: "Person updated successfully",
        });
      });
      