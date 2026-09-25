
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PeopleCoreLanding());

const navy = Color(0xFF061B3A);
const navy2 = Color(0xFF0B2D5C);
const blue = Color(0xFF1769E0);
const gold = Color(0xFFF2B01E);
const light = Color(0xFFF5F8FC);
const textDark = Color(0xFF10233F);
const muted = Color(0xFF667085);

class PeopleCoreLanding extends StatelessWidget {
  const PeopleCoreLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeopleCore HR Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
      ),
      home: const LandingPage(),
    );
  }
}

Future<void> openUrl(String value) async {
  final uri = Uri.parse(value);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final featuresKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.sizeOf(context).width < 900
          ? Drawer(child: _mobileMenu())
          : null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: navy,
            toolbarHeight: 76,
            leading: MediaQuery.sizeOf(context).width < 900
                ? Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                : null,
            title: _brand(),
            actions: MediaQuery.sizeOf(context).width >= 900
                ? [
                    _navButton('Features', () => scrollTo(featuresKey)),
                    _navButton('How it works', () => scrollTo(featuresKey)),
                    _navButton('About', () => scrollTo(contactKey)),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: FilledButton(
                        onPressed: () => scrollTo(contactKey),
                        style: FilledButton.styleFrom(
                          backgroundColor: gold,
                          foregroundColor: navy,
                        ),
                        child: const Text('Book a Demo'),
                      ),
                    ),
                  ]
                : null,
          ),
          SliverToBoxAdapter(child: _hero(context)),
          SliverToBoxAdapter(child: _trustBar()),
          SliverToBoxAdapter(child: _problemSolution(context)),
          SliverToBoxAdapter(child: _features(context, featuresKey)),
          SliverToBoxAdapter(child: _lifecycle()),
          SliverToBoxAdapter(child: _roles(context)),
          SliverToBoxAdapter(child: _demoSection(context, contactKey)),
          SliverToBoxAdapter(child: _faq()),
          SliverToBoxAdapter(child: _footer()),
        ],
      ),
    );
  }

  Widget _brand() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: gold, width: 2),
            ),
            child: const Center(
              child: Text('P', style: TextStyle(color: gold, fontWeight: FontWeight.w900, fontSize: 22)),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PeopleCore', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
              Text('HR PORTAL', style: TextStyle(color: gold, fontSize: 10, letterSpacing: 3, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      );

  Widget _navButton(String label, VoidCallback onTap) => TextButton(
        onPressed: onTap,
        child: Text(label, style: const TextStyle(color: Colors.white70)),
      );

  Widget _mobileMenu() => SafeArea(
        child: Column(
          children: [
            Container(
              color: navy,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: _brand(),
            ),
            ListTile(title: const Text('Features'), onTap: () { Navigator.pop(context); scrollTo(featuresKey); }),
            ListTile(title: const Text('How it works'), onTap: () { Navigator.pop(context); scrollTo(featuresKey); }),
            ListTile(title: const Text('About'), onTap: () { Navigator.pop(context); scrollTo(contactKey); }),
            ListTile(
              title: const Text('Book a Demo'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () { Navigator.pop(context); scrollTo(contactKey); },
            ),
          ],
        ),
      );

  Widget _hero(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 850;
    return Container(
      color: navy,
      padding: EdgeInsets.fromLTRB(wide ? 7 * 8.0 : 24, 50, wide ? 56 : 24, 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: wide
              ? Row(
                  children: [
                    Expanded(child: _heroCopy()),
                    const SizedBox(width: 40),
                    Expanded(child: _heroImage()),
                  ],
                )
              : Column(
                  children: [
                    _heroCopy(),
                    const SizedBox(height: 35),
                    _heroImage(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _heroCopy() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: blue.withOpacity(.18),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: blue.withOpacity(.55)),
            ),
            child: const Text('MODERN HR MANAGEMENT FOR GROWING TEAMS',
                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
          ),
          const SizedBox(height: 22),
          const Text('SMART HR.\nSTRONGER BUSINESS.',
              style: TextStyle(color: Colors.white, fontSize: 48, height: .98, fontWeight: FontWeight.w900)),
          const SizedBox(height: 20),
          const Text(
            'Manage employees, attendance, leave, payroll, recruitment and performance from one secure platform.',
            style: TextStyle(color: Colors.white70, fontSize: 19, height: 1.55),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => openUrl('mailto:hello@peoplecore.example?subject=PeopleCore%20Demo%20Request'),
                style: FilledButton.styleFrom(
                  backgroundColor: gold,
                  foregroundColor: navy,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                ),
                child: const Text('Book a Free Demo', style: TextStyle(fontWeight: FontWeight.w800)),
              ),
              OutlinedButton(
                onPressed: () => openUrl('https://example.com'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white54),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                ),
                child: const Text('Try PeopleCore'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Wrap(
            spacing: 18,
            runSpacing: 10,
            children: [
              _MiniTrust(icon: Icons.verified_user_outlined, text: 'Role-based access'),
              _MiniTrust(icon: Icons.devices_outlined, text: 'Web & mobile ready'),
              _MiniTrust(icon: Icons.insights_outlined, text: 'Real-time analytics'),
            ],
          ),
        ],
      );

  Widget _heroImage() => ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Image.asset('assets/peoplecore-hero.png', fit: BoxFit.cover),
      );

  Widget _trustBar() => Container(
        color: light,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
        child: const Center(
          child: Text('EMPLOYEE MANAGEMENT  •  ATTENDANCE  •  LEAVE  •  PAYROLL  •  RECRUITMENT  •  PERFORMANCE',
              textAlign: TextAlign.center,
              style: TextStyle(color: navy2, fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: .8)),
        ),
      );

  Widget _problemSolution(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: LayoutBuilder(builder: (context, c) {
              final wide = c.maxWidth > 760;
              final children = [
                _infoCard(
                  icon: Icons.warning_amber_rounded,
                  title: 'Still managing HR manually?',
                  body: 'Spreadsheets, emails and paper forms make it harder to keep employee records current and approvals organized.',
                  dark: true,
                ),
                _infoCard(
                  icon: Icons.auto_awesome,
                  title: 'Move HR into one system',
                  body: 'PeopleCore centralizes workforce information and gives employees, managers and HR a clear digital workflow.',
                ),
              ];
              return wide
                  ? Row(children: [Expanded(child: children[0]), const SizedBox(width: 20), Expanded(child: children[1])])
                  : Column(children: [children[0], const SizedBox(height: 20), children[1]]);
            }),
          ),
        ),
      );

  Widget _infoCard({required IconData icon, required String title, required String body, bool dark = false}) =>
      Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: dark ? navy : light,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: dark ? Colors.transparent : const Color(0xFFE1E8F0)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(backgroundColor: dark ? blue : Colors.white, child: Icon(icon, color: dark ? Colors.white : blue)),
          const SizedBox(height: 22),
          Text(title, style: TextStyle(color: dark ? Colors.white : textDark, fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Text(body, style: TextStyle(color: dark ? Colors.white70 : muted, fontSize: 16, height: 1.6)),
        ]),
      );

  Widget _features(BuildContext context, GlobalKey key) => Container(
        key: key,
        color: light,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: Column(
              children: [
                _sectionHeading('Everything HR needs', 'One connected platform for the employee lifecycle.'),
                const SizedBox(height: 40),
                LayoutBuilder(builder: (context, c) {
                  final columns = c.maxWidth > 900 ? 3 : c.maxWidth > 600 ? 2 : 1;
                  final features = [
                    ['Employees', 'Centralized employee profiles, departments, roles and employment records.', Icons.people_alt_outlined],
                    ['Attendance', 'Clock-in/out, working hours, attendance history and manager visibility.', Icons.schedule_outlined],
                    ['Leave', 'Digital requests, approvals, balances and transparent leave workflows.', Icons.event_available_outlined],
                    ['Payroll', 'Salary components, deductions, payroll processing and PDF payslips.', Icons.payments_outlined],
                    ['Recruitment', 'Vacancies, candidates, interview stages and hiring pipeline management.', Icons.work_outline],
                    ['Performance', 'Goals, reviews, feedback and performance history for your workforce.', Icons.trending_up],
                    ['Onboarding', 'Structured checklists and tasks for every new employee.', Icons.login_outlined],
                    ['Offboarding', 'Clearance, asset return, account deactivation and exit workflows.', Icons.logout_outlined],
                    ['Reports', 'Workforce analytics for attendance, leave, payroll and recruitment.', Icons.bar_chart_outlined],
                  ];
                  return Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    children: features.map((f) => SizedBox(
                      width: (c.maxWidth - 36) / columns,
                      child: _featureCard(f[0] as String, f[1] as String, f[2] as IconData),
                    )).toList(),
                  );
                }),
              ],
            ),
          ),
        ),
      );

  Widget _featureCard(String title, String body, IconData icon) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE4EAF2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: blue, size: 32),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(color: textDark, fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 8),
          Text(body, style: const TextStyle(color: muted, height: 1.5)),
        ]),
      );

  Widget _lifecycle() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 85),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(children: [
              _sectionHeading('One platform. One employee journey.', 'Manage the complete lifecycle from recruitment to exit.'),
              const SizedBox(height: 45),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 14,
                children: [
                  'Recruitment', 'Hiring', 'Onboarding', 'Attendance', 'Leave', 'Payroll', 'Performance', 'Offboarding'
                ].asMap().entries.map((e) => Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                    decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(30)),
                    child: Text(e.value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                  if (e.key < 7) const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.arrow_forward, size: 16, color: gold)),
                ])).toList(),
              ),
            ]),
          ),
        ),
      );

  Widget _roles(BuildContext context) => Container(
        color: navy,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(children: [
              _sectionHeading('Built for every HR stakeholder', 'Each role sees the tools and information they need.', lightText: true),
              const SizedBox(height: 40),
              LayoutBuilder(builder: (context, c) {
                final roles = [
                  ['Employee', 'Self-service profile, attendance, leave, payslips, expenses and announcements.', Icons.person_outline],
                  ['Manager', 'Team attendance, leave approvals, tasks and performance reviews.', Icons.supervisor_account_outlined],
                  ['HR', 'Employees, payroll, recruitment, onboarding, documents and reports.', Icons.badge_outlined],
                  ['Admin', 'Users, permissions, company settings, analytics and audit controls.', Icons.admin_panel_settings_outlined],
                ];
                final width = c.maxWidth > 850 ? (c.maxWidth - 48) / 4 : c.maxWidth > 600 ? (c.maxWidth - 16) / 2 : c.maxWidth;
                return Wrap(
                  spacing: 16, runSpacing: 16,
                  children: roles.map((r) => SizedBox(width: width, child: _roleCard(r[0] as String, r[1] as String, r[2] as IconData))).toList(),
                );
              }),
            ]),
          ),
        ),
      );

  Widget _roleCard(String title, String body, IconData icon) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(color: Colors.white.withOpacity(.08), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: gold, size: 30),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(body, style: const TextStyle(color: Colors.white70, height: 1.5)),
        ]),
      );

  Widget _demoSection(BuildContext context, GlobalKey key) => Container(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1050),
            child: Container(
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [navy, navy2]),
                borderRadius: BorderRadius.circular(28),
              ),
              child: LayoutBuilder(builder: (context, c) {
                final wide = c.maxWidth > 700;
                final copy = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Ready to modernize your HR?', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 14),
                  const Text('See how PeopleCore can fit your company’s HR workflow. Book a personalized demo and explore the platform with your team.',
                      style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.55)),
                  const SizedBox(height: 24),
                  Wrap(spacing: 12, runSpacing: 12, children: [
                    FilledButton(
                      onPressed: () => openUrl('mailto:hello@peoplecore.example?subject=PeopleCore%20Demo%20Request'),
                      style: FilledButton.styleFrom(backgroundColor: gold, foregroundColor: navy, padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16)),
                      child: const Text('Book a Demo'),
                    ),
                    OutlinedButton(
                      onPressed: () => openUrl('mailto:hello@peoplecore.example'),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white54), padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16)),
                      child: const Text('Contact Sales'),
                    ),
                  ]),
                ]);
                return wide ? Row(children: [Expanded(child: copy), const SizedBox(width: 35), ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.asset('assets/george.jpg', width: 290, height: 300, fit: BoxFit.cover))]) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [copy, const SizedBox(height: 28), ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.asset('assets/george.jpg', height: 260, width: double.infinity, fit: BoxFit.cover))]);
              }),
            ),
          ),
        ),
      );

  Widget _faq() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(children: [
              _sectionHeading('Frequently asked questions', 'A few answers for teams considering PeopleCore.'),
              const SizedBox(height: 28),
              const ExpansionTile(title: Text('Can PeopleCore support different user roles?'), children: [Padding(padding: EdgeInsets.all(16), child: Text('Yes. The platform is designed around Employee, Manager, HR and Admin roles with role-based permissions.'))]),
              const ExpansionTile(title: Text('Can payroll be customized?'), children: [Padding(padding: EdgeInsets.all(16), child: Text('Yes. Salary components, allowances and deductions can be configured for an organization. Statutory rules should be configured for the relevant jurisdiction.'))]),
              const ExpansionTile(title: Text('Can it be customized for our company?'), children: [Padding(padding: EdgeInsets.all(16), child: Text('Yes. Workflows, branding, approval processes, reporting and integrations can be adapted to company requirements.'))]),
              const ExpansionTile(title: Text('Is it available on mobile?'), children: [Padding(padding: EdgeInsets.all(16), child: Text('The Flutter application is designed to support responsive web and mobile deployment.'))]),
            ]),
          ),
        ),
      );

  Widget _footer() => Container(
        color: const Color(0xFF031329),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('© 2026 PeopleCore HR Portal', style: TextStyle(color: Colors.white60)),
                TextButton(onPressed: () => openUrl('mailto:hello@peoplecore.example'), child: const Text('hello@peoplecore.example')),
              ],
            ),
          ),
        ),
      );

  Widget _sectionHeading(String title, String subtitle, {bool lightText = false}) => Column(
        children: [
          Text(title, textAlign: TextAlign.center, style: TextStyle(color: lightText ? Colors.white : textDark, fontSize: 34, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          Text(subtitle, textAlign: TextAlign.center, style: TextStyle(color: lightText ? Colors.white70 : muted, fontSize: 16, height: 1.5)),
        ],
      );
}

class _MiniTrust extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MiniTrust({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: gold, size: 18),
        const SizedBox(width: 7),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
      ]);
}
