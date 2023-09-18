/* import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:reservation_appl/common/custom_countries.dart';
import 'package:reservation_appl/logic/bloc/autentikacija_bloc.dart';

import '../../logic/bloc/korisnik_bloc.dart';

class PrijavaHomeScreen extends StatefulWidget {
  const PrijavaHomeScreen({super.key});

  @override
  State<PrijavaHomeScreen> createState() => _PrijavaHomeScreenState();
}

class _PrijavaHomeScreenState extends State<PrijavaHomeScreen> {
  String smsKod = '';
  String brojMobitela= '';


  @override
  Widget build(BuildContext context) {
    double mqHeight = MediaQuery.of(context).size.height;
    double mqWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<AutentikacijaBloc, AutentikacijaState>(
            listener: (context, state) async {
              if (state.postoji && state.logged) {
                context.read<KorisnikBloc>().add(GetKorisnikEvent(id: state.uid));
                context.go('/pocetna');
              } else {
                if (!state.postoji && state.logged) {
                context.go('/registracija');
                }
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.fromLTRB(mqWidth * 0.1,mqHeight * 0.0, mqWidth * 0.01, mqHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(mqWidth * 0,mqHeight * 0.0, mqWidth * 0.09, mqHeight * 0.0),
                        child: SizedBox(
                          height: mqHeight * 0.5,
                          width: mqWidth * 0.4,
                          child: const Image(
                            image: AssetImage('assets/icons/new_logo.png')
                          ),
                        ),
                      ).animate(delay: Duration(milliseconds: 600))
                      .slideY(begin: 0.464, end: 0, duration: Duration(milliseconds: 670), curve: Curves.easeInCubic)
                      ,
                    ),
                    if (!state.postoji)
                    Visibility(
                     
                        child:  Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                          child: Text('Registracija', style: TextStyle(fontFamily: 'Roboto', fontSize: 28, fontWeight: FontWeight.bold)
                          ),
                        ).animate(target: state.postoji ? 0 : 1).slideX(begin: 2, end: 0)
                      
                    ),
                     if (state.postoji)
                    Visibility(
                      child: Animate(
                        effects: [SlideEffect(begin: Offset(0, -1), end: Offset(0, 0), duration: Duration(milliseconds: 670), curve: Curves.easeIn)],
                        delay: Duration(milliseconds: 850),
                        target: state.postoji ? 1:0,
                        child:  Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                          child: Text('Prijava', style: TextStyle(fontFamily: 'Roboto', fontSize: 28, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 25.0),
                      child: Container(
                        height: mqHeight * 0.055,
                        width: mqWidth * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: const [
                            BoxShadow(color: Color(0x22000000), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 3.0))
                          ]
                        ),
                        child: IntlPhoneField(
                          onChanged: (valBroj) {
                            brojMobitela= (valBroj.completeNumber);
                          },
                          countries: List.of(mojeZemlje),
                          autovalidateMode: AutovalidateMode.disabled,
                          invalidNumberMessage: 'Broj nije valjan',
                          languageCode: "hr",
                          style: const TextStyle(fontFamily: 'Roboto', fontSize: 17.0),
                            keyboardType: TextInputType.phone,
                            pickerDialogStyle: PickerDialogStyle(
                              searchFieldInputDecoration: const InputDecoration(
                                icon: Icon(Icons.search),
                                hintText: 'Traži zemlju'
                              )
                            ),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Telefonski broj',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
                          ),
                          initialCountryCode: 'HR',
                        ),
                      ),
                    ).animate(delay: Duration(milliseconds: 850))
                    .slideY(begin: 9, end: 0, duration: Duration(milliseconds: 670), curve: Curves.easeIn),
                    if (state.kodPoslan)
                    Animate(
                      child: Container(
                        width: mqWidth * 0.8,
                        height: mqHeight * 0.055,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color(0x22000000), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 3.0))
                          ],
                        ),
                        child: TextField(
                          enabled: state.kodPoslan ? true : false,
                          onChanged: (valueNum) {
                            smsKod = valueNum.toString();
                          },
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Unesite SMS kod',
                            filled: true,
                            fillColor: state.kodPoslan ? Colors.white : Colors.grey[300],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
                          ),
                        ),
                      ).animate(delay: Duration(milliseconds: 100))
                      .slideX(begin: -9, end: 0, duration: Duration(milliseconds: 670), curve: Curves.easeIn),
                    ),
                    if (state.kodPoslan)
                    Padding(
                      padding: EdgeInsets.fromLTRB(mqWidth * 0.2, 20.0, 20.0, 20.0),
                      child: SizedBox(
                        height: mqHeight * 0.055,
                        width: mqWidth * 0.4,
                        child: TextButton(
                          onPressed: () {
                            if (state.kodPoslan) {
                              context.read<AutentikacijaBloc>().add(StigaoKodPrijaviSeRucnoEvent(otpCode: smsKod));
                            } else {
                              context.read<AutentikacijaBloc>().add(SlanjeBrojaIZahtjevZaPrijavuEvent(brojMobitela: brojMobitela));
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF023047),
                          ),
                          child: Text('Nastavi' , style: const TextStyle(fontFamily: 'Roboto', fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ).animate(delay: Duration(milliseconds: 100))
                    .slideX(begin: -9, end: 0, duration: Duration(milliseconds: 670), curve: Curves.easeIn),
                    if (!state.kodPoslan)
                    Padding(
                      padding: EdgeInsets.fromLTRB(mqWidth * 0.2, 20.0, 20.0, 20.0),
                      child: SizedBox(
                        height: mqHeight * 0.055,
                        width: mqWidth * 0.4,
                        child: TextButton(
                          onPressed: () {
                            if (state.kodPoslan) {
                              context.read<AutentikacijaBloc>().add(StigaoKodPrijaviSeRucnoEvent(otpCode: smsKod));
                            } else {
                              context.read<AutentikacijaBloc>().add(SlanjeBrojaIZahtjevZaPrijavuEvent(brojMobitela: brojMobitela));
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF023047),
                          ),
                          child: Text( 'Pošalji kod', style: const TextStyle(fontFamily: 'Roboto', fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ).animate(delay: Duration(milliseconds: 850))
                    .slideY(begin: 9, end: 0, duration: Duration(milliseconds: 670), curve: Curves.easeIn),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
} */
