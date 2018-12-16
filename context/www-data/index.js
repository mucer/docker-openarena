const express = require('express');
const app = express();
 
app.get('/', (req, res) => res.send('OpenArena Server'));
app.use('/download', express.static('/var/oa/home'));
app.use('/download', express.static('/opt/openarena-0.8.8'));

app.listen(80);