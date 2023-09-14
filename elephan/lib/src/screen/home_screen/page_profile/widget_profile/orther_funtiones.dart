import 'package:flutter/material.dart';

const Color logoutItemColor = Colors.red;
Widget otherFunctionsProfile({Function? onTap, Icon? icon, String? title}) {
  return Column(
    children: [
      itemProfille(
          () {},
          const Icon(
            Icons.payments_outlined,
            size: 34,
          ),
          "Quản lý thanh toán"),
      itemProfille(
          () {},
          const Icon(
            Icons.security_outlined,
            size: 34,
          ),
          "Chia sẻ thông tin cá nhân"),
      itemProfille(
          () {},
          const Icon(
            Icons.star_outline,
            size: 34,
          ),
          "Đánh giá elephan"),
      itemProfille(
          () {},
          const Icon(
            Icons.notifications_none_outlined,
            size: 34,
          ),
          "Thông báo"),
      itemProfille(
          () {},
          const Icon(
            Icons.support_agent_outlined,
            size: 34,
          ),
          "Hỗ trợ"),
      itemProfille(
          () {},
          const Icon(
            Icons.info_outlined,
            size: 34,
          ),
          "Điều khoản và chính sách"),
      itemProfille(
        () {},
        const Icon(
          Icons.logout_outlined,
          color: Colors.red,
          size: 36,
        ),
        "Đăng xuất",
        color: Colors.red,
      ),
    ],
  );
}

InkWell itemProfille(Function? onTap, Icon? icon, String? title,
    {Color? color}) {
  return InkWell(
    onTap: () => onTap?.call(),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          icon!,
          const SizedBox(
            width: 20,
          ),
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: title == "Đăng xuất" ? 20 : 16,
              fontWeight: FontWeight.w600,
              color: color ?? Colors.black,
            ),
          )
        ],
      ),
    ),
  );
}
