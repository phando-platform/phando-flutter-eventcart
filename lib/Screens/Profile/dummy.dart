//  return ListView.builder(
//                                     shrinkWrap: true,
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     itemCount: snapshot.data?.value
//                                             ?.data?[index].details?.length ??
//                                         10,
//                                     itemBuilder: (_, i) {
//                                       return Card(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.0)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: ListTile(
//                                             /* leading: Image.network(snapshot
//                                                     .data
//                                                     ?.value
//                                                     ?.data?[index]
//                                                     .details?[i]
//                                                     .product
//                                                     ?.images?[0]
//                                                     .image ??
//                                                 ''),*/
//                                             title: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 /* Text(
//                                                   snapshot
//                                                           .data
//                                                           ?.value
//                                                           ?.data?[index]
//                                                           .details?[i]
//                                                           .product
//                                                           ?.name ??
//                                                       '',
//                                                   style: kTextStyle.copyWith(
//                                                       color: kTitleColor),
//                                                 ),*/
//                                                 Row(
//                                                   children: [
//                                                     Text(
//                                                       '#${snapshot.data?.value?.data?[index].orderNo}',
//                                                       style: kTextStyle.copyWith(
//                                                           color:
//                                                               kGreyTextColor),
//                                                     ),
//                                                     const Spacer(),
//                                                     Text(
//                                                       '$currencyIcon ${snapshot.data?.value?.data?[index].details?[i].salePrice}',
//                                                       style:
//                                                           kTextStyle.copyWith(
//                                                               color:
//                                                                   kMainColor),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                             subtitle: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 5.0),
//                                               child: Row(
//                                                 children: [
//                                                   Container(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             4.0),
//                                                     decoration: BoxDecoration(
//                                                       color: kBgColor,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               4.0),
//                                                     ),
//                                                     child: Text(
//                                                       snapshot
//                                                               .data
//                                                               ?.value
//                                                               ?.data?[index]
//                                                               .paymentBy ??
//                                                           '',
//                                                       style:
//                                                           kTextStyle.copyWith(
//                                                               color: kRedColor),
//                                                     ).onTap(() {}),
//                                                   ),
//                                                   const Spacer(),
//                                                   Text(
//                                                     formattedDate.substring(
//                                                         0, 10),
//                                                     style: kTextStyle.copyWith(
//                                                         color: kGreyTextColor),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ).onTap(
//                                         () => DeliveryStatus(
//                                           details: snapshot.data!.value!
//                                               .data![index].details![i],
//                                           orderId: snapshot
//                                               .data!.value!.data![index].id
//                                               .toString(),
//                                         ).launch(context),
//                                       );
//                                     });