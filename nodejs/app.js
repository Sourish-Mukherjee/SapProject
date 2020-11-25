const express = require('express');
const ejs = require('ejs');
const app = express();
const admin=require('firebase-admin');
const bodyParser = require('body-parser');
const serviceAccount=require('./sapproject-28227-firebase-adminsdk-hcmqw-6058543d99.json');


admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
  });

const db=admin.firestore();

app.set('view engine', 'ejs');
app.use(express.static(__dirname + "/public"));
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.json())



app.get('/', (req,res) => {
    res.render('landing');
})

// Manager Routes
app.get('/manager', (req,res) => {
    let tasks = []
    db.collection('Task').get().then((response)=>{
        response.forEach((data)=>{
            if(data.data().reviewed==false){
                let tempobj = data.data();
                tempobj.id=data.id;
                tasks.push(tempobj);
            }
        })
    }).then(()=>{
        // console.log(tasks);
        let employee = [
            {
                name: 'Employee 1',
                email: '1@gmail.com'
            },
            {
                name: 'Employee 2',
                email: '2@gmail.com'
            },
            {
                name: 'Employee 3',
                email: '3@gmail.com'
            }
        ]
        res.render('manager/manager',{tasks:tasks,employee:employee});
    })
    
})

// Show Employee report of the month
app.get('/manager/report', (req,res) => {
    let employee = [
        {
            name: 'Employee 1',
            email: '1@gmail.com'
        },
        {
            name: 'Employee 2',
            email: '2@gmail.com'
        },
        {
            name: 'Employee 3',
            email: '3@gmail.com'
        }
    ]
    res.render('manager/report',{employee:employee})
})

// Creating Tasks
app.post('/task/create', (req,res) => {
    let obj = req.body;
    obj.completed = false;
    obj.reviewed = false;
    obj.completedate = null;
    obj.taskpoints = 0;
    obj.totalpoints = Number(obj.totalpoints)
    obj.deadline=new Date(obj.deadline);
    obj.manager = "Aman";
    obj.employee=obj.email;
    delete obj.email;
    console.log(obj);
    db.collection('Task').add(req.body).then(data => {
        res.redirect('/manager');
    }).catch(err => res.json({message: 'some error occured'}))
})
// Reviewing Tasks
app.post('/task/review', (req,res) => {
    console.log(req.body);
    db.collection('Task').doc(req.body.id).set({
        taskpoints: Number(req.body.taskpoints),
        reviewed: true
    },{merge:true}).then(()=>{
        res.json({message: 'success'})
    }).catch((err) => {
        res.json({message:'error'})
    })
})
// Reassign task
app.post('/task/reassign', (req,res) =>{
    // console.log(req.body);
    db.collection('Task').doc(req.body.id).set({
        taskpoints: Number(req.body.taskpoints),
        reviewed:true,
        completed:true,
        completedate: new Date()
    },{merge: true}).then(()=>{
        db.collection('Task').get().then((response)=>{
            let obj={};
            response.forEach((data)=>{
                if(data.id == req.body.id){
                    obj = data.data();
                }
            })
            obj.employee = req.body.newEmployeeEmail;
            obj.totalpoints = obj.totalpoints - req.body.taskpoints;
            obj.taskpoints = 0;
            obj.deadline = new Date();
            obj.completed = false;
            obj.completedate = null;
            obj.reviewed = false;
            db.collection('Task').add(obj).then(data=>{
                res.json({message:'success'});
            }).catch(err=>{
                res.json({message:'error'})
            })
        });
    });
    
})

// Generate Report and send task data
app.post('/employee/report', (req,res)=>{
    let email = req.body.email;
    let month = req.body.month;
    let tasks = [];
    let monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"
    ];
    db.collection('Task').get().then((response)=>{
        response.forEach((data)=>{
            let obj = data.data();
            // console.log(obj);
            if(obj.reviewed==true && obj.employee==email){
                if((monthNames[new Date(obj.completedate._seconds*1000).getMonth()]==month) &&(new Date(obj.completedate._seconds*1000).getFullYear() == (new Date()).getFullYear()) ){
                    tasks.push(obj);
                }
            }
        })
        console.log(tasks);
        res.json(tasks);
    })
})


// Employee Routes
app.get('/employee',(req,res)=>{
    tasks=[
        {
            name: 'Task 1',
            employee: 'Employee 1',
            points: 0,
            totalPoints: 10,
            deadline: '2020-12-06',
            link: 'www.google.com',
            description: 'This is Task 1',
            completed: true   
        },
        {
            name: 'Task 2',
            employee: 'Employee 2',
            points: 0,
            totalPoints: 20,
            deadline: '2020-12-06',
            link: 'www.google.com',
            description: 'This is Task 2',
            completed: true   
        },
    ]
    res.render('employee',{tasks:tasks});
});

app.get('/employee/formWellBeing',(req,res)=>{
    res.render('employeeHealth');
});


// HR Routes
app.get('/hr', (req,res) => {
    res.render('hr/hr');
})

app.post('/health/:id', (req,res)=>{
    console.log(req.body);
    let id = req.params.id;
    data = [{
        id: id,
        date: new Date(),
        status: 'sick'
    },
    {
        id: id,
        date: new Date(),
        status: 'not sick'
    }]
    res.json(data);
})

app.post('/monthlyreport/:id', (req,res) => {
    let id = req.params.id;
    data = [{
        id: id,
        date: new Date(),
        status: 'sick'
    },
    {
        id: id,
        date: new Date(),
        status: 'not sick'
    }]
    res.json(data);
})

// Server Listening at Port 3000
app.listen('3000', ()=>{
    console.log('Server Started at Port 3000...')
});



// app.get('/', (req,res) => {
//     res.render('sample');
// })

// app.post('/', (req, res) => {
//     let name=req.body.name;
//     var temp=db.collection('users').doc(name);
//     return temp.set({complaint: req.body.complaint, department: req.body.dept}).then(()=>
//     console.log('Entered')
//     );
// });