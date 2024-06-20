import 'package:ludokin_agent/data/models/movie.dart';
import 'package:ludokin_agent/data/providers/api_provider.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';
import 'package:ludokin_agent/ui/widgets/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/routes.dart';
import '../widgets/movie_field.dart';
import '../widgets/kin_snackbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiProvider _apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOVIES APP").tr(),
      ),

      body: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
                  child:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                    children: [
                      const Gap(size: 5),
                      Container(
                        height: w*0.35,
                        child: Column(
                            children:[
                        Container(
                            height: 140,
                            width: 289,
                            margin: const EdgeInsets.all(20),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Column(
                                  children: [
                                  const Text(
                                    "balance",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ).tr(),
                                const Gap(size: 45),
                                const Text(
                                  "0.00 Fcfa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                )
                              ]
                          ),

                        )
                    ),
                    const Gap(size: 20),
                    Container(
                      alignment: Alignment.bottomLeft,
                        child: const Text("movies",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              // color: Colors.deepPurple,
                              decoration: TextDecoration.underline,
                            ),
                          textAlign: TextAlign.left,
                        ).tr(),
                    ),
                      BlocConsumer<MovieCubit, MovieState>(
                        listener: (BuildContext context,MovieState state){
                          if(state is LoadingMovieFailed){
                          showErrorSnack(context,state.message);
                          }
                      },
                        builder: (BuildContext context, MovieState state) {
                          switch(state.runtimeType){
                            case LoadingMovie :
                              return  const Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
                            case LoadingMovieSuccess:
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                // context.read<MovieCubit>().movies.value.length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, int index) {
                                  return Column(
                                    children: [
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                    ],
                                  );
                                },
                              );
                            default:
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                // context.read<MovieCubit>().movies.value.length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, int index) {
                                  return Column(
                                    children: [
                                      const Gap(),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                      const Gap(),
                                      ShowMovie( movie: movie),
                                    ],
                                  );
                                },
                              );
                          }
                        }
                      )
                        ],),
                  )
          )
      )
    );
    
  }
  @override
  void initState() {
    context.read<CommandCubit>().getAllCommands();
  }
}
