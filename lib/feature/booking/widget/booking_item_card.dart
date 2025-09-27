// import 'package:demandium/common/models/popup_menu_model.dart';
// import 'package:demandium/feature/booking/widget/booking_status_widget.dart';
// import 'package:demandium/helper/booking_helper.dart';
// import 'package:get/get.dart';
// import 'package:demandium/utils/core_export.dart';
//
// class BookingItemCard extends StatelessWidget {
//   final BookingModel bookingModel;
//   final int index;
//
//   const BookingItemCard({super.key, required this.bookingModel, required this.index}) ;
//
//
//   @override
//   Widget build(BuildContext context) {
//     String bookingStatus = bookingModel.bookingStatus!;
//     return InkWell(
//       onTap: () {
//         if(bookingModel.isRepeatBooking == 1){
//           Get.toNamed(RouteHelper.getRepeatBookingDetailsScreen(bookingId:bookingModel.id!));
//         }else{
//           Get.toNamed(RouteHelper.getBookingDetailsScreen(bookingID:bookingModel.id!));
//         }
//       },
//
//       child: GetBuilder<ServiceBookingController>(builder: (serviceBookingController){
//          return GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
//         return Container(
//           decoration: BoxDecoration(color: Theme.of(context).cardColor , borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//               border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1), width: 0.5),
//               boxShadow: Get.find<ThemeController>().darkTheme ? null : lightShadow
//           ),//boxShadow: shadow),
//           padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeEight,horizontal: Dimensions.paddingSizeDefault),
//           margin:  const EdgeInsets.symmetric(horizontal: 2,),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//
//               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                 Row(
//                   children: [
//                     Text('${'booking'.tr}# ${bookingModel.readableId}', style: robotoBold.copyWith()),
//                     if(bookingModel.isRepeatBooking == 1)Container(
//                       decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
//                       padding: const EdgeInsets.all(2),
//                       margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
//                       child: const Icon(Icons.repeat, color: Colors.white,size: 10,),
//                     )
//                   ],
//                 ),
//
//                 PopupMenuButton<PopupMenuModel>(
//                   shape:  RoundedRectangleBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault,)),
//                     side: BorderSide(color: Theme.of(context).hintColor.withValues(alpha: 0.1)),
//                   ),
//                   surfaceTintColor: Theme.of(context).cardColor,
//                   position: PopupMenuPosition.under, elevation: 8,
//                   shadowColor: Theme.of(context).hintColor.withValues(alpha: 0.3),
//                   itemBuilder: (BuildContext context) {
//                     return serviceBookingController.getPopupMenuList( status: bookingStatus, isRepeatBooking: bookingModel.isRepeatBooking == 1).map((PopupMenuModel option) {
//                       return PopupMenuItem<PopupMenuModel>(
//                         value: option,
//                         height: 35,
//                         onTap: () async {
//
//                           if(option.title == "booking_details"){
//                             if(bookingModel.isRepeatBooking == 1){
//                               Get.toNamed(RouteHelper.getRepeatBookingDetailsScreen( bookingId :bookingModel.id!));
//                             }else{
//                               Get.toNamed(RouteHelper.getBookingDetailsScreen(bookingID :bookingModel.id!,));
//                             }
//                           }
//                           if(option.title == "rebook"){
//                             serviceBookingController.updateRebookIndex(index);
//
//                            await serviceBookingController.checkCartSubcategory(bookingModel.id!, bookingModel.subCategoryId!);
//
//                           }
//
//                           else if(option.title == "download_invoice"){
//                             String uri = "";
//                             String languageCode = Get.find<LocalizationController>().locale.languageCode;
//                             if(bookingModel.isRepeatBooking == 1){
//                               uri = "${AppConstants.baseUrl}${AppConstants.repeatBookingInvoiceUrl}${bookingModel.id}/$languageCode";
//                             }else{
//                               uri = "${AppConstants.baseUrl}${AppConstants.regularBookingInvoiceUrl}${bookingModel.id}/$languageCode";
//                             }
//                             if (kDebugMode) {
//                               print("Uri : $uri");
//                             }
//                             await _launchUrl(Uri.parse(uri));
//                           } else {
//
//                           }
//
//                         },
//                         child: Row(
//                           children: [
//                             const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
//                             Icon(option.icon, size: Dimensions.fontSizeLarge,),
//                             const SizedBox(width: Dimensions.paddingSizeSmall,),
//                             Text(option.title.tr, style: robotoRegular.copyWith(
//                                 fontSize: Dimensions.fontSizeSmall
//                             ),),
//                           ],
//                         ),
//                       );
//                     }).toList();
//                   },
//                   child:  Icon(Icons.more_vert_sharp, color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.6),),
//                 ),
//               ]),
//               const SizedBox(height: Dimensions.paddingSizeEight,),
//
//               Row( children: [
//                 Text('${'booking_date'.tr} : ', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),
//                 Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateConverter.isoUtcStringToLocalDate(bookingModel.createdAt.toString())),textDirection: TextDirection.ltr,
//                     style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),],),
//               const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
//
//               Row( children: [
//                 Text('${'service_date'.tr} : ', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),
//                 if(BookingHelper.getRepeatBookingCurrentSchedule(bookingModel) !=null) Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateTime.tryParse(BookingHelper.getRepeatBookingCurrentSchedule(bookingModel)!)!),
//                   style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6)),
//                   textDirection: TextDirection.ltr,
//                 ),
//               ]),
//
//               if (bookingDetailsController.bookingDetailsContent != null)
//                 Row(
//                   children: [
//                     Text(
//                       '${'due_amount'.tr} : ',
//                       style: robotoRegular.copyWith(
//                         fontSize: Dimensions.fontSizeSmall,
//                         color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6),
//                       ),
//                     ),
//                     Text(
//                       PriceConverter.convertPrice(bookingDetailsController.dueAmount),
//                       style: robotoRegular.copyWith(
//                         fontSize: Dimensions.fontSizeSmall,
//                         color: Colors.red,  // Or any color you want to highlight
//                       ),
//                       textDirection: TextDirection.ltr,
//                     ),
//                   ],
//                 ),
//
//
//               const SizedBox(height: Dimensions.paddingSizeSmall,),
//
//               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
//
//                 BookingStatusButtonWidget(bookingStatus: bookingModel.bookingStatus,),
//
//                  if (bookingModel.isPaid == 0 && bookingStatus != "canceled" && bookingModel.paymentMethod == "cash_after_service")
//             ElevatedButton(
//               onPressed: () {
//                 debugPrint("Booking ID: ${bookingModel.id.toString()}");
//                 bookingDetailsController.showCustomPayViaOnlineDialog(bookingModel.id);
//               },
//               child: Text("Pay"),
//             ),
//
//                 Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Text(PriceConverter.convertPrice(bookingModel.totalBookingAmount!.toDouble()),   ////////Balu
//                     style: robotoBold.copyWith(color: Theme.of(context).colorScheme.primary),
//                   ),
//                 ),
//               ],),
//             ],
//           ),
//         );
//       });
//       }),
//     );
//   }
//
//   Future<void> _launchUrl(Uri url) async {
//     if (!await launchUrl(url)) {
//       throw 'Could not launch $url';
//     }
//   }
// }




/////////////// old


import 'package:demandium/common/models/popup_menu_model.dart';
import 'package:demandium/feature/booking/widget/booking_status_widget.dart';
import 'package:demandium/helper/booking_helper.dart';
import 'package:get/get.dart';
import 'package:demandium/utils/core_export.dart';

class BookingItemCard extends StatelessWidget {
  final BookingModel bookingModel;
  final int index;

  const BookingItemCard({super.key, required this.bookingModel, required this.index}) ;


  @override
  Widget build(BuildContext context) {
    String bookingStatus = bookingModel.bookingStatus!;
    return InkWell(
      onTap: () {
        if(bookingModel.isRepeatBooking == 1){
          Get.toNamed(RouteHelper.getRepeatBookingDetailsScreen(bookingId:bookingModel.id!));
        }else{
          Get.toNamed(RouteHelper.getBookingDetailsScreen(bookingID:bookingModel.id!));
        }
      },

      child: GetBuilder<ServiceBookingController>(builder: (serviceBookingController){
        return GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
          return Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor , borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1), width: 0.5),
                boxShadow: Get.find<ThemeController>().darkTheme ? null : lightShadow
            ),//boxShadow: shadow),
            padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeEight,horizontal: Dimensions.paddingSizeDefault),
            margin:  const EdgeInsets.symmetric(horizontal: 2,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text('${'booking'.tr}# ${bookingModel.readableId}',
                              style: robotoBold.copyWith(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if(bookingModel.isRepeatBooking == 1)Container(
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                            child: const Icon(Icons.repeat, color: Colors.white,size: 10,),
                          )
                        ],
                      ),
                    ),

                    PopupMenuButton<PopupMenuModel>(
                      shape:  RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault,)),
                        side: BorderSide(color: Theme.of(context).hintColor.withValues(alpha: 0.1)),
                      ),
                      surfaceTintColor: Theme.of(context).cardColor,
                      position: PopupMenuPosition.under, elevation: 8,
                      shadowColor: Theme.of(context).hintColor.withValues(alpha: 0.3),
                      itemBuilder: (BuildContext context) {
                        return serviceBookingController.getPopupMenuList( status: bookingStatus, isRepeatBooking: bookingModel.isRepeatBooking == 1).map((PopupMenuModel option) {
                          return PopupMenuItem<PopupMenuModel>(
                            value: option,
                            height: 35,
                            onTap: () async {

                              if(option.title == "booking_details"){
                                if(bookingModel.isRepeatBooking == 1){
                                  Get.toNamed(RouteHelper.getRepeatBookingDetailsScreen( bookingId :bookingModel.id!));
                                }else{
                                  Get.toNamed(RouteHelper.getBookingDetailsScreen(bookingID :bookingModel.id!,));
                                }
                              }
                              if(option.title == "rebook"){
                                serviceBookingController.updateRebookIndex(index);

                                await serviceBookingController.checkCartSubcategory(bookingModel.id!, bookingModel.subCategoryId!);

                              }

                              else if(option.title == "download_invoice"){
                                String uri = "";
                                String languageCode = Get.find<LocalizationController>().locale.languageCode;
                                if(bookingModel.isRepeatBooking == 1){
                                  uri = "${AppConstants.baseUrl}${AppConstants.repeatBookingInvoiceUrl}${bookingModel.id}/$languageCode";
                                }else{
                                  uri = "${AppConstants.baseUrl}${AppConstants.regularBookingInvoiceUrl}${bookingModel.id}/$languageCode";
                                }
                                if (kDebugMode) {
                                  print("Uri : $uri");
                                }
                                await _launchUrl(Uri.parse(uri));
                              } else {

                              }

                            },
                            child: Row(
                              children: [
                                const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                                Icon(option.icon, size: Dimensions.fontSizeLarge,),
                                const SizedBox(width: Dimensions.paddingSizeSmall,),
                                Text(option.title.tr, style: robotoRegular.copyWith(
                                    fontSize: Dimensions.fontSizeSmall
                                ),),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      child:  Icon(Icons.more_vert_sharp, color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.6),),
                    ),
                  ]),
                  const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                  Row( children: [
                    Text('${'booking_date'.tr} : ', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),
                    Expanded(
                      child: Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateConverter.isoUtcStringToLocalDate(bookingModel.createdAt.toString())),
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),
                    ),
                  ],),
                  const SizedBox(height: 2,),

                  Row( children: [
                    Text('${'service_date'.tr} : ', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6))),
                    if(BookingHelper.getRepeatBookingCurrentSchedule(bookingModel) !=null)
                      Expanded(
                        child: Text(DateConverter.dateMonthYearTimeTwentyFourFormat(DateTime.tryParse(BookingHelper.getRepeatBookingCurrentSchedule(bookingModel)!)!),
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6)),
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ]),

                  if (bookingDetailsController.bookingDetailsContent != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          Text(
                            '${'due_amount'.tr} : ',
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: .6),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              PriceConverter.convertPrice(bookingDetailsController.dueAmount),
                              style: robotoRegular.copyWith(
                                fontSize: Dimensions.fontSizeSmall,
                                color: Colors.red,
                              ),
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
                    Expanded(
                      flex: 2,
                      child: BookingStatusButtonWidget(bookingStatus: bookingModel.bookingStatus,),
                    ),

                    // Updated condition to show pay button for both scenarios
                    if ((bookingModel.isPaid == 0 && bookingStatus != "canceled" && bookingModel.paymentMethod == "cash_after_service") ||
                        (bookingDetailsController.bookingDetailsContent != null &&
                            bookingDetailsController.dueAmount != null &&
                            bookingDetailsController.dueAmount > 0))
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            minimumSize: const Size(0, 32),
                          ),
                          onPressed: () {
                            debugPrint("Booking ID: ${bookingModel.id.toString()}");
                            bookingDetailsController.showCustomPayViaOnlineDialog(bookingModel.id);
                          },
                          child: Text(
                            bookingDetailsController.dueAmount != null && bookingDetailsController.dueAmount > 0
                                ? "pay_now".tr
                                : "Pay",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),

                    Expanded(
                      flex: 1,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(PriceConverter.convertPrice(bookingModel.totalBookingAmount!.toDouble()),   ////////Balu
                          style: robotoBold.copyWith(color: Theme.of(context).colorScheme.primary),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}