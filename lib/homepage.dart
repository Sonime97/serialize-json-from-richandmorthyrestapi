import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(child: IconButton(icon: Icon(Icons.logout),onPressed: () {
              Provider.of<Products>(context,listen: false).logout();
            },))],
        ),
        body: FutureBuilder(
          future: Provider.of<Products>(context).getWeather(),
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            
           var name;
           if(snapshot.hasData)  {
           name = snapshot.data;
            
           }
           else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('wait a little');
           }
           else if(snapshot.hasError) {
            name = 'error occured';
           }
           
            return ListView.builder(
              itemCount: name.name.length,
              itemBuilder: (context,index) => 
              
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('${name.name[index]}'),
                  Container(height: 50,
                  child: Image.network(name.image[index])
                  )
                  ])
                
                )
                );
          })
      ),
    );
      
    
  }
}
