import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Title
              Text(
                "Terms & Conditions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Text(
                "Welcome to The Main Label. Please review the following basic terms that govern your use of, and purchase of, products from our site. Please note that your use of our site constitutes your agreement to follow and be bound by those terms.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: General
              Text(
                "General",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "By using our website, you agree to the Terms of Use. We may change or update these terms so please check this page regularly. We do not represent or warrant that the information on our web site is accurate, complete, or current. This includes pricing and availability information. We reserve the right to correct any errors or omissions, and to change or update information at any time without giving prior notice.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Correction of Errors
              Text(
                "Correction of Errors and Inaccuracies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "The information on the site may contain typographical errors or inaccuracies and may not be complete or current. The Main Label therefore reserves the right to correct any errors, inaccuracies or omissions and to change or update information at any time with or without prior notice (including after you have submitted your order). Please note that such errors, inaccuracies or omissions may relate to product description, pricing, product availability, or otherwise.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Tax
              Text(
                "Tax",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "As a seller, you are responsible for collecting and paying taxes associated with any profits made through The Main Label. The Main Label will issue 1099-K forms to all sellers in the United States who receive more than \$600.00 or \$2,000.00 in profits to comply with IRS requirements. All forms will be mailed to the address you’ve indicated in your profile by January 31 for the previous year.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Return Policy
              Text(
                "Return Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "Since we only manufacture what is ordered, The Main Label does not accept returns or exchanges at this time. All instant purchases should be discussed directly with the seller you purchased from as they are responsible for their own shop policies. If you are unhappy with your order for any reason at all, please contact The Main Label at customerservice@themainlabel.com and we’ll work with you to make it right. We will not accept any packages sent without authorization, any shipments received that have not been authorized will be refused/shipped back. Please make sure that you have carefully reviewed your order prior to finalizing your purchase.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Cancellations
              Text(
                "Cancellations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "If you decide that you no longer want your order for any reason you may cancel it as long as the campaign period is still active. However, once a campaign ends, we are unable to cancel an order as the information has already been sent to the printer for manufacturing and fulfillment.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Colors
              Text(
                "Colors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "We have made the strongest of efforts to display all product colors that appear on the Site as accurately as possible. However, as the actual colors you see will depend on your monitor and/or other technological circumstance, we cannot and do not guarantee that your monitor's display of any color will be accurate.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Product Availability
              Text(
                "Product Availability",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "Although availability may be indicated on our site, we cannot guarantee product availability or immediate delivery. We reserve the right, without liability or prior notice to revise, discontinue, or cease to make available any or all products or to cancel any order.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              // Section: Shipping & Delivery
              Text(
                "Shipping & Delivery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "For all orders within North America, please allow approximately 14 business days from the time a campaign ends (please note this is different from the time of purchase) to receive your order. For all international orders, please allow approximately 21 business days from the time a campaign ends (please note this is different from the time of purchase) to receive your order. You will receive an email from The Main Label when your order has been confirmed. If you still have not received your purchase after the above mentioned times, please notify customerservice@themainlabel.com.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              SizedBox(height: 20),

              Text(
                "Can't find what you're looking for? Email us",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
