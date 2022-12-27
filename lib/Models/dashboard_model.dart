class DashboardModel {
  String? status;
  String? msg;
  Result? result;

  DashboardModel({this.status, this.msg, this.result});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<BannerList>? bannerList;
  List<CategoryList>? categoryList;
  List<SallerProductList>? sallerProductList;
  String? mainText;
  String? subText;
  String? aboutusLink;
  List<ContactDetailsData>? contactDetailsData;
  List<AboutData>? aboutData;
  // List<ResourceData>? resourceData;
  List<SocialData>? socialData;
  // List<CityFooterData>? cityFooterData;
  String? referEarnLink;
  String? youtubeVideo;
  List<DashboardCalender>? dashboardCalender;
  List<NotifyBannerForUser>? notifyBannerForUser;
  ReferEarnText? referEarnText;
  List<DrawerData>? drawerData;
  String? customerTier;

  Result(
      {this.bannerList,
      this.categoryList,
      this.sallerProductList,
      this.mainText,
      this.subText,
      this.aboutusLink,
      this.contactDetailsData,
      this.aboutData,
      // this.resourceData,
      this.socialData,
      // this.cityFooterData,
      this.referEarnLink,
      this.youtubeVideo,
      this.dashboardCalender,
      this.notifyBannerForUser,
      this.referEarnText,
      this.drawerData,
      this.customerTier});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['banner_list'] != null) {
      bannerList = <BannerList>[];
      json['banner_list'].forEach((v) {
        bannerList!.add(BannerList.fromJson(v));
      });
    }
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    if (json['saller_product_list'] != null) {
      sallerProductList = <SallerProductList>[];
      json['saller_product_list'].forEach((v) {
        sallerProductList!.add(new SallerProductList.fromJson(v));
      });
    }
    mainText = json['main_text'];
    subText = json['sub_text'];
    aboutusLink = json['aboutus_link'];
    if (json['contact_details_data'] != null) {
      contactDetailsData = <ContactDetailsData>[];
      json['contact_details_data'].forEach((v) {
        contactDetailsData!.add(new ContactDetailsData.fromJson(v));
      });
    }
    if (json['about_data'] != null) {
      aboutData = <AboutData>[];
      json['about_data'].forEach((v) {
        aboutData!.add(AboutData.fromJson(v));
      });
    }
    // if (json['resource_data'] != null) {
    //   resourceData = <ResourceData>[];
    //   json['resource_data'].forEach((v) {
    //     resourceData!.add(new ResourceData.fromJson(v));
    //   });
    // }
    if (json['social_data'] != null) {
      socialData = <SocialData>[];
      json['social_data'].forEach((v) {
        socialData!.add(SocialData.fromJson(v));
      });
    }
    // if (json['city_footer_data'] != null) {
    //   cityFooterData = <CityFooterData>[];
    //   json['city_footer_data'].forEach((v) {
    //     cityFooterData!.add(new CityFooterData.fromJson(v));
    //   });
    // }
    referEarnLink = json['refer_earn_link'];
    youtubeVideo = json['youtube_video'];
    if (json['dashboard_calender'] != null) {
      dashboardCalender = <DashboardCalender>[];
      json['dashboard_calender'].forEach((v) {
        dashboardCalender!.add(DashboardCalender.fromJson(v));
      });
    }
    if (json['notify_banner_for_user'] != null) {
      notifyBannerForUser = <NotifyBannerForUser>[];
      json['notify_banner_for_user'].forEach((v) {
        notifyBannerForUser!.add(NotifyBannerForUser.fromJson(v));
      });
    }
    referEarnText = json['refer_earn_text'] != null
        ? ReferEarnText.fromJson(json['refer_earn_text'])
        : null;
    if (json['drawer_data'] != null) {
      drawerData = <DrawerData>[];
      json['drawer_data'].forEach((v) {
        drawerData!.add(DrawerData.fromJson(v));
      });
    }
    customerTier = json['customer_tier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.bannerList != null) {
      data['banner_list'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    if (this.sallerProductList != null) {
      data['saller_product_list'] =
          this.sallerProductList!.map((v) => v.toJson()).toList();
    }
    data['main_text'] = this.mainText;
    data['sub_text'] = this.subText;
    data['aboutus_link'] = this.aboutusLink;
    if (this.contactDetailsData != null) {
      data['contact_details_data'] =
          this.contactDetailsData!.map((v) => v.toJson()).toList();
    }
    if (this.aboutData != null) {
      data['about_data'] = this.aboutData!.map((v) => v.toJson()).toList();
    }
    // if (this.resourceData != null) {
    //   data['resource_data'] =
    //       this.resourceData!.map((v) => v.toJson()).toList();
    // }
    if (this.socialData != null) {
      data['social_data'] = this.socialData!.map((v) => v.toJson()).toList();
    }
    // if (this.cityFooterData != null) {
    //   data['city_footer_data'] =
    //       this.cityFooterData!.map((v) => v.toJson()).toList();
    // }
    data['refer_earn_link'] = this.referEarnLink;
    data['youtube_video'] = this.youtubeVideo;
    if (this.dashboardCalender != null) {
      data['dashboard_calender'] =
          this.dashboardCalender!.map((v) => v.toJson()).toList();
    }
    if (this.notifyBannerForUser != null) {
      data['notify_banner_for_user'] =
          this.notifyBannerForUser!.map((v) => v.toJson()).toList();
    }
    if (this.referEarnText != null) {
      data['refer_earn_text'] = this.referEarnText!.toJson();
    }
    if (this.drawerData != null) {
      data['drawer_data'] = this.drawerData!.map((v) => v.toJson()).toList();
    }
    data['customer_tier'] = this.customerTier;
    return data;
  }
}

class BannerList {
  String? bannerId;
  String? bannerPhoto;
  String? link;

  BannerList({this.bannerId, this.bannerPhoto, this.link});

  BannerList.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerPhoto = json['banner_photo'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['banner_photo'] = this.bannerPhoto;
    data['link'] = this.link;
    return data;
  }
}

class CategoryList {
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  CategoryList({this.categoryId, this.categoryName, this.categoryImage});

  CategoryList.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}

class SallerProductList {
  String? productId;
  String? productName;
  String? productPackageName;
  String? productPackageMrp;
  String? vdiscountedPrice;
  String? offerPrice;
  String? offerTag;
  String? productPackageId;
  String? productImage;

  SallerProductList(
      {this.productId,
      this.productName,
      this.productPackageName,
      this.productPackageMrp,
      this.vdiscountedPrice,
      this.offerPrice,
      this.offerTag,
      this.productPackageId,
      this.productImage});

  SallerProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPackageName = json['product_package_name'];
    productPackageMrp = json['product_package_mrp'];
    vdiscountedPrice = json['vdiscounted_price'];
    offerPrice = json['offer_price'];
    offerTag = json['offer_tag'];
    productPackageId = json['product_package_id'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_package_name'] = this.productPackageName;
    data['product_package_mrp'] = this.productPackageMrp;
    data['vdiscounted_price'] = this.vdiscountedPrice;
    data['offer_price'] = this.offerPrice;
    data['offer_tag'] = this.offerTag;
    data['product_package_id'] = this.productPackageId;
    data['product_image'] = this.productImage;
    return data;
  }
}

class ContactDetailsData {
  String? id;
  String? content;
  String? address;
  String? phone;
  String? email;

  ContactDetailsData(
      {this.id, this.content, this.address, this.phone, this.email});

  ContactDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class AboutData {
  String? id;
  String? name;
  String? url;
  String? type;

  AboutData({this.id, this.name, this.url, this.type});

  AboutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class SocialData {
  String? id;
  String? name;
  String? url;

  SocialData({this.id, this.name, this.url});

  SocialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class DashboardCalender {
  String? date;
  String? day;
  String? color;

  DashboardCalender({this.date, this.day, this.color});

  DashboardCalender.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['color'] = this.color;
    return data;
  }
}

class NotifyBannerForUser {
  String? mainTextMarketing;
  String? middleTextMarketing;
  String? bottomTextMarketing;

  NotifyBannerForUser(
      {this.mainTextMarketing,
      this.middleTextMarketing,
      this.bottomTextMarketing});

  NotifyBannerForUser.fromJson(Map<String, dynamic> json) {
    mainTextMarketing = json['main_text_marketing'];
    middleTextMarketing = json['middle_text_marketing'];
    bottomTextMarketing = json['bottom_text_marketing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['main_text_marketing'] = this.mainTextMarketing;
    data['middle_text_marketing'] = this.middleTextMarketing;
    data['bottom_text_marketing'] = this.bottomTextMarketing;
    return data;
  }
}

class ReferEarnText {
  String? titleText;
  String? subText;

  ReferEarnText({this.titleText, this.subText});

  ReferEarnText.fromJson(Map<String, dynamic> json) {
    titleText = json['title_text'];
    subText = json['sub_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title_text'] = this.titleText;
    data['sub_text'] = this.subText;
    return data;
  }
}

class DrawerData {
  String? faqLink;
  String? supportLink;
  String? termAndConditionsLink;
  String? whyChooseAkLink;

  DrawerData(
      {this.faqLink,
      this.supportLink,
      this.termAndConditionsLink,
      this.whyChooseAkLink});

  DrawerData.fromJson(Map<String, dynamic> json) {
    faqLink = json['faq_link'];
    supportLink = json['support_link'];
    termAndConditionsLink = json['term_and_conditions_link'];
    whyChooseAkLink = json['why_choose_ak_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['faq_link'] = this.faqLink;
    data['support_link'] = this.supportLink;
    data['term_and_conditions_link'] = this.termAndConditionsLink;
    data['why_choose_ak_link'] = this.whyChooseAkLink;
    return data;
  }
}
