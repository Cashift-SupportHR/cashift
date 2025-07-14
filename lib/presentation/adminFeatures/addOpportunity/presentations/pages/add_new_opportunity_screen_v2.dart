import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/adminFeatures/addOpportunity/data/models/add_opportunity_params.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/projects_picker.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/workingPeriodsProject/widgets/jobs_picker.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/addNewUser/widgets/company_picker.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/helper_widgets.dart';
import 'package:shiftapp/common/components/snckBar/snack_bar_manager.dart';
import 'package:shiftapp/common/components/stream/stream_data_state_widget.dart';
import 'package:shiftapp/presentation/shared/models/common_list_item.dart';
import '../../../../../common/components/radio/radio_grid_list.dart';
import '../../../../../common/components/texts/underline_text.dart';
import '../../../projectsManagement/domain/entities/job.dart';
import '../../data/models/contract_condition_params.dart';
import '../../data/models/filter_shift_params.dart';
import '../../data/models/schedule_price_opportunity.dart';
import '../../data/models/schedule_price_opportunity_params.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import '../../domain/entities/employee_opportunity_type.dart';
import '../../domain/entities/shift.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import '../widgets/attendance_departure_method_picker.dart';
import '../widgets/method_calculating_opportunity_picker.dart';
import '../widgets/method_selecting_employees_picker.dart';
import '../widgets/opportunity_select_date.dart';
import '../widgets/schedule_price_opportunity_salary.dart';
import '../widgets/working_period_shift_picker.dart';

class AddNewOpportunityScreenV2 extends BaseStatelessWidget {
  final Opportunity? opportunity;
  final InitializedOpportunity state;
  final Function(AddOpportunityParams) addOpp;
  final Function(SchedulePriceOpportunityParams) getSchedulePriceOpportunity;
  final Function(int id) onFetchProjectsCompanyId;
  final Function(int id) onFetchJobsByProjectId;
  final Function(ContractConditionParams) onFetchContractConditions;
  final Function(FilterShiftParams) onFetchShiftData;

  AddNewOpportunityScreenV2({
    Key? key,
    this.opportunity,
    required this.state,
    required this.addOpp,
    required this.getSchedulePriceOpportunity,
    required this.onFetchProjectsCompanyId,
    required this.onFetchJobsByProjectId,
    required this.onFetchContractConditions,
    required this.onFetchShiftData,
  }) : super(key: key);

  TextEditingController? jobController;
  TextEditingController? contractsController;
  TextEditingController? methodCalcOppController;
  TextEditingController? opportunityDateController;
  TextEditingController? workingPeriodController;
  TextEditingController? salaryController;
  TextEditingController? opportunityNumController;
  TextEditingController? startAllowMinutesController;
  TextEditingController? typeApproveController;
  TextEditingController? endAllowMinutesController;
  TextEditingController? lastRequiredCount;
  bool typeApprove = true;
  int contractId = 0;
  int jobId = 0;
  int companyId = 0;
  int calcOpportunityId = 0;
  int listShiftId = 0;
  int projectId = 0;
  bool isAllowEditPrice = false;
  bool isAllowEditDateOpp = false;
  String startShiftTime = '';
  String workingData = '';
  int startAllowMinutes = 0;
  int endAllowMinutes = 0;
  int hoursCount = 0;
  bool isAllowEditTime = false;
  int attendanceTypeId = 0;
  int isAcceptAllEmployee = 0;
  int methodSelectEmployeeId = 0;
  List<int> employeesIds = [];
  StreamState<List<ListShift>> listShiftFilter = StreamStateInitial();
  StreamState<SchedulePriceOpportunity> schedulePriceOpportunityStream =
      StreamStateInitial();
  StreamState<bool> isAllowEditDateOppStream = StreamStateInitial();
  StreamState<bool> isAllowEditTimeStream = StreamStateInitial();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  List opportunityDates = [];

  @override
  Widget build(BuildContext context) {
    initData();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnderlineText(
              text: strings.job_opportunity_details,
              fontSize: 16,
            ),
            const SizedBox(
              height: 25,
            ),
            companiesPicker(),
            projectsPicker(),
            jobsPicker(),
            StreamDataStateWidget(
              stream: state.contractConditionsStream,
              builder: (c, date) {
                contractId = date?.id ?? 0;
                return Column(
                  children: [
                    opportunitySelectDate(),
                    workingPeriodShift(),
                    schedulePriceOpportunitySalary(),
                    numberRequiredForOpportunity(),
                    methodSelectingEmployees(),
                    const SizedBox(
                      height: 20,
                    ),
                    backUpNumber(),
                    methodCalculatingOpportunity(),
                    methodArrivalDeparture(),
                    methodAcceptEmployees(),
                    const SizedBox(
                      height: 20,
                    ),
                    saveButton(context),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isSelectEmployee = true;

  addOpportunity(BuildContext context) async {
    print('addopportunityemployee opportunity $isAllowEditPrice');
    if (employeesIds.isEmpty && isSelectEmployee) {
      SnackBarManager.showErrorSnackBar(
          context, strings.please_select_employees);
      return;
    }
    final data = AddOpportunityParams(
      id: opportunity?.id,
      contractConditionsId: contractId,
      jobId: jobId,
      calcOppId: calcOpportunityId,
      shiftId: listShiftId,
      workingData: opportunity?.id == null ? opportunityDates : workingData,
      requiredCount: int.parse(opportunityNumController!.text.trim()),
      startAllowMinutes: startAllowMinutes,
      endAllowMinutes: endAllowMinutes,
      autoApprove: typeApprove,
      isAllowEditPrice: isAllowEditPrice,
      description: '',
      isAllowEditTime: isAllowEditTime,
      reserveNumber: int.parse(lastRequiredCount!.text.trim()),
      startShiftTime: startShiftTime,
      hoursCount: hoursCount,
      salary: double.parse(salaryController!.text.trim()),
      attendanceTypeId: attendanceTypeId,
      freeLancerIds: employeesIds,
      completeFreeLanceInfoByCompanyAprovelLevelId: methodSelectEmployeeId,
      isAcceptAllEmployeeByApprovalLevel: isAcceptAllEmployee,
    );
    print('data ${data.toJson()}');
    addOpp(data);
  }

  selectTime(BuildContext context,
      {required String title,
      required void Function(Duration) onTimerDurationChanged}) async {
    Duration duration = const Duration(hours: 0, minutes: 30);
    showAppModalBottomSheet(
      context: context,
      isScrollControlled: false,
      title: title,
      child: Column(
        children: [
          Expanded(
            child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: duration,
                onTimerDurationChanged: (value) {
                  duration = value;
                }),
          ),
          AppCupertinoButton(
            text: strings.save_button,
            onPressed: () {
              onTimerDurationChanged(duration);
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String convertMinutesToHoursAndMinutes(int minutes) {
    int hours = minutes ~/ 60;
    int minutesLeft = minutes % 60;
    return '$hours:$minutesLeft';
  }

  FilterShiftParams filterShiftParams = FilterShiftParams();

  OpportunitySelectDate opportunitySelectDate() {
    return OpportunitySelectDate(
      isAllowEditDateOppStream: isAllowEditDateOppStream,
      opportunityId: opportunity?.id,
      opportunityDateController: opportunityDateController,
      onPressed: (dates) {
        print('opportunityDateController ${opportunityDateController!.text}');
        print('dates ${dates}');
        opportunityDates = dates;
        print(opportunityDates);
      },
    );
  }

  WorkingPeriodShift workingPeriodShift() {
    return WorkingPeriodShift(
      shiftDataStream: state.shiftDataStream,
      workingPeriodController: workingPeriodController,
      formContractFieldKey: _formKey2,
      onSelectItem: (item, items) async {
        workingPeriodController!.text = item.value;
        listShiftId = item.index;
        hoursCount =
            items.firstWhere((element) => element.id == item.index).hoursCount!;
        startShiftTime =
            items.firstWhere((element) => element.id == item.index).startShift!;
        final data = SchedulePriceOpportunityParams(
          comapnyId:
              items.firstWhere((element) => element.id == item.index).companyId,
          projectId: projectId,
          jobId: jobId,
          shiftId: item.index,
          workDate: opportunityDates[0],
        );
        // fetch price of opportunity from api
        salaryController!.clear();
        isAllowEditPrice = false;
        getSchedulePriceOpportunity(data);
      },
    );
  }

  SchedulePriceOpportunitySalary schedulePriceOpportunitySalary() {
    return SchedulePriceOpportunitySalary(
      schedulePriceOpportunityStream: state.priceOpportunityStream,
      salaryController: salaryController!,
      isAllowEditPrice: isAllowEditPrice,
      onAllowEditPrice: (value) {
        isAllowEditPrice = value;
      },
    );
  }

  BuildTextFieldItem numberRequiredForOpportunity() {
    return BuildTextFieldItem(
      title: strings.number_required_for_opportunity,
      hintText: strings.type_number_required_for_opportunity,
      controller: opportunityNumController,
      maxLength: 2,
    );
  }

  StreamStateInitial<int> companyIdStream = StreamStateInitial();

  StreamBuilder<int> methodSelectingEmployees() {
    return StreamBuilder<int>(
        initialData: companyId,
        stream: companyIdStream.stream,
        builder: (context, snapshot) {
          return MethodSelectingEmployeesPicker(
            data: state.employeesTypes,
            opportunityId: opportunity?.id,
            companyId: snapshot.data ?? 0,
            initialId: methodSelectEmployeeId,
            isAllEmployees: isAcceptAllEmployee,
            isClear: methodSelectEmployeeId == 0,
            onSelectItem: (args) {
              isAcceptAllEmployee = args.isAll ?? 2;
              methodSelectEmployeeId = args.employeeType?.id ?? 0;
              employeesIds = args.employeesIds ?? [];
              isSelectEmployee = args.isSelectEmployee ?? true;
            },
          );
        });
  }

  AttendanceDepartureMethodPicker methodArrivalDeparture() {
    return AttendanceDepartureMethodPicker(
      initialId: attendanceTypeId,
      data: state.arrivalDepartureTypes
          .map((e) => EmployeeOpportunityType.fromArrivalDepartureType(e))
          .toList(),
      onSelectItem: (id) {
        attendanceTypeId = id;
        print('attendanceTypeId $attendanceTypeId');
      },
    );
  }

  BuildTextFieldItem backUpNumber() {
    return BuildTextFieldItem(
      title: strings.back_up_number,
      hintText: strings.type_back_up_number,
      controller: lastRequiredCount,
      maxLength: 2,
    );
  }

  MethodCalculatingOpportunity methodCalculatingOpportunity() {
    return MethodCalculatingOpportunity(
      calcOpportunity: state.calcOpportunity,
      methodCalcOppController: methodCalcOppController,
      onSelectItem: (item) {
        methodCalcOppController!.text = item.value;
        calcOpportunityId = item.index;
      },
    );
  }

  Widget methodAcceptEmployees() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.method_accept_employees,
          style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
        ),
        SizedBox(
          height: 10,
        ),
        RadioGridList(
          items: state.typeApprove.typeApprove!
              .map((e) =>
                  RadioItem(value: e.type.toString(), title: e.name ?? ''))
              .toList(),
          groupValue: typeApprove.toString(),
          onChanged: (item) {
            typeApproveController!.text = item.value;
            typeApprove = (item.value == 'true') ? true : false;
          },
        ),
      ],
    );
  }

  CompanyPicker companiesPicker() {
    return CompanyPicker(
      items: state.companies ?? [],
      initialValue: opportunity?.companyName ?? '',
      onSelectItem: (item) {
        companyId = item.index;
        methodSelectEmployeeId = 0;
        companyIdStream.setData(companyId);
        jobController!.text = '';
        onFetchProjectsCompanyId(item.index);
      },
    );
  }

  StreamBuilder<List<CommonListItem>?> projectsPicker() {
    return StreamBuilder<List<CommonListItem>?>(
        stream: state.projectsStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ProjectsPicker(
                  items: snapshot.data ?? [],
                  initialValue: opportunity?.jobName ?? '',
                  onSelectItem: (item) {
                    projectId = item.index;
                    jobController!.text = '';
                    filterShiftParams.projectId = projectId;
                    onFetchJobsByProjectId(item.index);
                  },
                )
              : SizedBox.shrink();
        });
  }

  StreamBuilder<List<Job>?> jobsPicker() {
    return StreamBuilder<List<Job>?>(
        stream: state.jobsStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? JobsPicker(
                  controller: jobController,
                  items: snapshot.data ?? [],
                  initialValue: opportunity?.jobName ?? '',
                  onSelectItem: (item) {
                    jobId = item.index;
                    filterShiftParams.jobId = jobId;
                    workingPeriodController!.text = '';
                    onFetchContractConditions(
                      ContractConditionParams(
                        projectId: projectId,
                        jobId: jobId,
                      ),
                    );
                    onFetchShiftData(filterShiftParams);
                  },
                )
              : SizedBox.shrink();
        });
  }

  AppCupertinoButton saveButton(BuildContext context) {
    return AppCupertinoButton(
        text: strings.save_button,
        radius: BorderRadius.circular(8),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            addOpportunity(context);
          }
        });
  }

  void initData() {
    print('contractConditionsName ${opportunity?.contractConditionsName}');
    jobController = TextEditingController(text: opportunity?.jobName ?? '');
    contractsController =
        TextEditingController(text: opportunity?.contractConditionsName ?? '');
    opportunityDateController = TextEditingController(
        text: DateFormatter.formatDateStringNoPattern(
            opportunity?.workingData ?? ''));
    workingData = DateFormatter.formatDateStringNoLangCode(
        opportunity?.workingData ?? '');
    opportunityDates = [
      DateFormatter.formatDateStringNoPattern(opportunity?.workingData ?? '')
    ];
    workingPeriodController =
        TextEditingController(text: opportunity?.shift?.shiftName ?? '');
    print('salaryController ${opportunity?.salary?.toString()}');
    salaryController =
        TextEditingController(text: opportunity?.salary?.toString() ?? '');
    opportunityNumController = TextEditingController(
        text: opportunity?.requiredCount?.toString() ?? '');
    startAllowMinutesController = TextEditingController(
        text: convertMinutesToHoursAndMinutes(
            opportunity?.startAllowMinutes ?? 0));
    endAllowMinutesController = TextEditingController(
        text:
        convertMinutesToHoursAndMinutes(opportunity?.endAllowMinutes ?? 0));
    methodCalcOppController =
        TextEditingController(text: opportunity?.calcOpp?.calcOppName ?? '');

    typeApprove = opportunity?.autoApprove ?? true;

    typeApproveController = TextEditingController(
        text: opportunity?.id != null
            ? state.typeApprove.typeApprove!
            .firstWhere((element) => element.type == typeApprove)
            .name
            : '');
    lastRequiredCount = TextEditingController(
        text: opportunity?.reserveNumber?.toString() ?? '');
    contractId = opportunity?.contractConditionsId ?? 140;
    jobId = opportunity?.jobId ?? 0;
    calcOpportunityId = opportunity?.calcOpp?.id ?? 0;
    listShiftId = opportunity?.shift?.id ?? 0;
    startShiftTime = opportunity?.startShiftTime ?? '';
    startAllowMinutes = opportunity?.startAllowMinutes ?? 0;
    endAllowMinutes = opportunity?.endAllowMinutes ?? 0;
    hoursCount = opportunity?.hoursCount ?? 0;
    isAllowEditPrice = opportunity?.isAllowEditPrice ?? false;
    isAllowEditTimeStream.setData(isAllowEditTime);
    print('isAllowEditPrices $isAllowEditPrice');
    projectId = opportunity?.projectId ?? 0;
    print('projectId $projectId');
    companyId = opportunity?.companyId ?? 0;
    print('companyId $companyId');
    print('jobId ${opportunity?.jobId}');

    projectId != 0
        ? onFetchShiftData(FilterShiftParams(
      projectId: projectId,
      jobId: jobId,
    ))
        : null;
    methodSelectEmployeeId = opportunity?.methodSelectEmployeeId ?? 0;
    print('methodSelectEmployeeId ${methodSelectEmployeeId}');
    isAcceptAllEmployee = opportunity?.isAcceptAllEmployee ?? 0;
    employeesIds = opportunity?.freeLancerIds ?? [];
    attendanceTypeId = opportunity?.attendanceTypeId ?? 0;
    print('attendanceTypeId ${attendanceTypeId}');
    bool isEdit = opportunity?.id != null && opportunity!.id != 0;
  }
}
