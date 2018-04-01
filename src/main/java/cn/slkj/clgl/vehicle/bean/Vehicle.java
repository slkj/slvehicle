package cn.slkj.clgl.vehicle.bean;
/**
 * 车辆登记信息
 * @author maxh
 *
 */
public class Vehicle {

	private String id;
	
	/********************** 注册登记摘要信息栏 ***********************/
	/**
	 * 车辆归属单位外键
	 */
	private String ownedId;
	/**
	 * 车辆归属单位名称
	 */
	private String ownedName;
	/**
	 * 机动车所有人
	 */
	private String regCompanyName;
	/**
	 * 身份证明名称
	 */
	private String regName;
	/**
	 * 身份证明名号码
	 */
	private String regNum;
	/**
	 * 车辆联系人
	 */
	private String txtContactMenber;
	/**
	 * 联系方式
	 */
	private String txtContactWay;
	/**
	 * 登记机关
	 */
	private String regAuthority;
	/**
	 * 登记日期
	 */
	private String regDate;

	/********************** 注册登记机动车信息栏 ***********************/
	/**
	 * 车牌号(主)
	 */
	private String carNumber;
	/**
	 * 车牌号(挂)
	 */
	private String carNumberTrailer;
	/**
	 * 车辆结构
	 */
	private String carType;
	/**
	 * 车辆分类
	 */
	private String classify;
	/**
	 * 车辆品牌
	 */
	private String carBrand;
	/**
	 * 车辆型号
	 */
	private String carModel;
	/**
	 * 车身颜色
	 */
	private String carColor;
	/**
	 * 车辆识别代号/车架号
	 */
	private String carVin;
	/**
	 * 国产/进口
	 */
	private String carProType;
	/**
	 * 发动机号
	 */
	private String carEngNum;
	/**
	 * 发动机型号
	 */
	private String carEngModel;
	/**
	 * 燃料种类
	 */
	private String carFuelType;
	/**
	 * 排量
	 */
	private String carDisplacement;
	/**
	 * 功率
	 */
	private String carPower;
	/**
	 * 制造厂名称
	 */
	private String carManuName;
	/**
	 * 转向形式
	 */
	private String carModality;
	/**
	 * 轮距(前)
	 */
	private String carTreadBe;
	/**
	 * 轮距(后)
	 */
	private String carTreadAfter;
	/**
	 * 轮胎数
	 */
	private String carTireNum;
	/**
	 * 轮胎规格
	 */
	private String carTireSpe;
	/**
	 * 钢板弹簧片数
	 */
	private String carNumOfSpring;
	/**
	 * 轴距
	 */
	private String carAxleDist;
	/**
	 * 轴数
	 */
	private String carAxleNum;
	/**
	 * 外廓尺寸(长)
	 */
	private String carOutLength;
	/**
	 * 外廓尺寸(宽)
	 */
	private String carOutWidth;
	/**
	 * 外廓尺寸(高)
	 */
	private String carOutHeight;
	/**
	 * 货箱内部尺寸(长)
	 */
	private String carContLength;
	/**
	 * 货箱内部尺寸(宽)
	 */
	private String carContWidth;
	/**
	 * 货箱内部尺寸(高)
	 */
	private String carContHeight;
	/**
	 * 总质量
	 */
	private String carTotalmass;
	/**
	 * 核定载质量(吨位/座位)
	 */
	private String carApproved;
	/**
	 * 核定载客
	 */
	private String carApprGuest;
	/**
	 * 准牵引总质量
	 */
	private String carTrac;
	/**
	 * 驾驶室载客
	 */
	private String carCabGuest;
	/**
	 * 使用性质
	 */
	private String carUseNatu;
	/**
	 * 使用性质
	 */
	private String carUseNatuName;
	/**
	 * 车辆获取方式
	 */
	private String carObtWay;
	/**
	 * 车辆出厂日期
	 */
	private String carFacDate;
	/**
	 * 发证时间
	 */
	private String carCertDate;

	/**
	 * 车辆正面彩色照片
	 */
	private String carImg;
	private String carImg2;
	private String carImg3;
	/**
	 * 操作人id

	 */
	private String operatorId;
	/**
	 * 操作人名称
	 */
	private String operatorName;
	/**
	 * 操作时间
	 */
	private String operatorTime;
	
	/**
	 * 录入时间
	 */
	private String entryTime;
	/**
	 * 录入人id

	 */
	private String entryId;
	/**
	 * 录入人名称
	 */
	private String entryName;
	/**
	 * 录入人单位
	 */
	private String depId;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOwnedId() {
		return ownedId;
	}

	public void setOwnedId(String ownedId) {
		this.ownedId = ownedId;
	}

	public String getOwnedName() {
		return ownedName;
	}

	public void setOwnedName(String ownedName) {
		this.ownedName = ownedName;
	}

	public String getRegCompanyName() {
		return regCompanyName;
	}

	public void setRegCompanyName(String regCompanyName) {
		this.regCompanyName = regCompanyName;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	public String getRegNum() {
		return regNum;
	}

	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}

	public String getTxtContactMenber() {
		return txtContactMenber;
	}

	public void setTxtContactMenber(String txtContactMenber) {
		this.txtContactMenber = txtContactMenber;
	}

	public String getTxtContactWay() {
		return txtContactWay;
	}

	public void setTxtContactWay(String txtContactWay) {
		this.txtContactWay = txtContactWay;
	}

	public String getRegAuthority() {
		return regAuthority;
	}

	public void setRegAuthority(String regAuthority) {
		this.regAuthority = regAuthority;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getCarNumberTrailer() {
		return carNumberTrailer;
	}

	public void setCarNumberTrailer(String carNumberTrailer) {
		this.carNumberTrailer = carNumberTrailer;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}


	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getCarBrand() {
		return carBrand;
	}

	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public String getCarVin() {
		return carVin;
	}

	public void setCarVin(String carVin) {
		this.carVin = carVin;
	}

	public String getCarProType() {
		return carProType;
	}

	public void setCarProType(String carProType) {
		this.carProType = carProType;
	}

	public String getCarEngNum() {
		return carEngNum;
	}

	public void setCarEngNum(String carEngNum) {
		this.carEngNum = carEngNum;
	}

	public String getCarEngModel() {
		return carEngModel;
	}

	public void setCarEngModel(String carEngModel) {
		this.carEngModel = carEngModel;
	}

	public String getCarFuelType() {
		return carFuelType;
	}

	public void setCarFuelType(String carFuelType) {
		this.carFuelType = carFuelType;
	}

	public String getCarDisplacement() {
		return carDisplacement;
	}

	public void setCarDisplacement(String carDisplacement) {
		this.carDisplacement = carDisplacement;
	}

	public String getCarPower() {
		return carPower;
	}

	public void setCarPower(String carPower) {
		this.carPower = carPower;
	}

	public String getCarManuName() {
		return carManuName;
	}

	public void setCarManuName(String carManuName) {
		this.carManuName = carManuName;
	}

	public String getCarModality() {
		return carModality;
	}

	public void setCarModality(String carModality) {
		this.carModality = carModality;
	}

	public String getCarTreadBe() {
		return carTreadBe;
	}

	public void setCarTreadBe(String carTreadBe) {
		this.carTreadBe = carTreadBe;
	}

	public String getCarTreadAfter() {
		return carTreadAfter;
	}

	public void setCarTreadAfter(String carTreadAfter) {
		this.carTreadAfter = carTreadAfter;
	}

	public String getCarTireNum() {
		return carTireNum;
	}

	public void setCarTireNum(String carTireNum) {
		this.carTireNum = carTireNum;
	}

	public String getCarTireSpe() {
		return carTireSpe;
	}

	public void setCarTireSpe(String carTireSpe) {
		this.carTireSpe = carTireSpe;
	}

	public String getCarNumOfSpring() {
		return carNumOfSpring;
	}

	public void setCarNumOfSpring(String carNumOfSpring) {
		this.carNumOfSpring = carNumOfSpring;
	}

	public String getCarAxleDist() {
		return carAxleDist;
	}

	public void setCarAxleDist(String carAxleDist) {
		this.carAxleDist = carAxleDist;
	}

	public String getCarAxleNum() {
		return carAxleNum;
	}

	public void setCarAxleNum(String carAxleNum) {
		this.carAxleNum = carAxleNum;
	}

	public String getCarOutLength() {
		return carOutLength;
	}

	public void setCarOutLength(String carOutLength) {
		this.carOutLength = carOutLength;
	}

	public String getCarOutWidth() {
		return carOutWidth;
	}

	public void setCarOutWidth(String carOutWidth) {
		this.carOutWidth = carOutWidth;
	}

	public String getCarOutHeight() {
		return carOutHeight;
	}

	public void setCarOutHeight(String carOutHeight) {
		this.carOutHeight = carOutHeight;
	}

	public String getCarContLength() {
		return carContLength;
	}

	public void setCarContLength(String carContLength) {
		this.carContLength = carContLength;
	}

	public String getCarContWidth() {
		return carContWidth;
	}

	public void setCarContWidth(String carContWidth) {
		this.carContWidth = carContWidth;
	}

	public String getCarContHeight() {
		return carContHeight;
	}

	public void setCarContHeight(String carContHeight) {
		this.carContHeight = carContHeight;
	}

	public String getCarTotalmass() {
		return carTotalmass;
	}

	public void setCarTotalmass(String carTotalmass) {
		this.carTotalmass = carTotalmass;
	}

	public String getCarApproved() {
		return carApproved;
	}

	public void setCarApproved(String carApproved) {
		this.carApproved = carApproved;
	}

	public String getCarApprGuest() {
		return carApprGuest;
	}

	public void setCarApprGuest(String carApprGuest) {
		this.carApprGuest = carApprGuest;
	}

	public String getCarTrac() {
		return carTrac;
	}

	public void setCarTrac(String carTrac) {
		this.carTrac = carTrac;
	}

	public String getCarCabGuest() {
		return carCabGuest;
	}

	public void setCarCabGuest(String carCabGuest) {
		this.carCabGuest = carCabGuest;
	}

	public String getCarUseNatu() {
		return carUseNatu;
	}

	public void setCarUseNatu(String carUseNatu) {
		this.carUseNatu = carUseNatu;
	}

	public String getCarUseNatuName() {
		return carUseNatuName;
	}

	public void setCarUseNatuName(String carUseNatuName) {
		this.carUseNatuName = carUseNatuName;
	}

	public String getCarObtWay() {
		return carObtWay;
	}

	public void setCarObtWay(String carObtWay) {
		this.carObtWay = carObtWay;
	}

	public String getCarFacDate() {
		return carFacDate;
	}

	public void setCarFacDate(String carFacDate) {
		this.carFacDate = carFacDate;
	}

	public String getCarCertDate() {
		return carCertDate;
	}

	public void setCarCertDate(String carCertDate) {
		this.carCertDate = carCertDate;
	}

	public String getCarImg() {
		return carImg;
	}

	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}

	public String getCarImg2() {
		return carImg2;
	}

	public void setCarImg2(String carImg2) {
		this.carImg2 = carImg2;
	}

	public String getCarImg3() {
		return carImg3;
	}

	public void setCarImg3(String carImg3) {
		this.carImg3 = carImg3;
	}

	public String getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getOperatorTime() {
		return operatorTime;
	}

	public void setOperatorTime(String operatorTime) {
		this.operatorTime = operatorTime;
	}

	public String getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}

	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	@Override
	public String toString() {
		return "Vehicle [id=" + id + ", ownedId=" + ownedId + ", regCompanyName=" + regCompanyName
				+ ", regName=" + regName + ", carNumber=" + carNumber + ", entryId=" + entryId
				+ ", depId=" + depId + "]";
	}

 

}
