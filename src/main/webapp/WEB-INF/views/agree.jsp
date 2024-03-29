<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/joinAgree.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>약관동의</title>
</head>


<body>
	<%@ include file="includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg" style="background: url(image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">회원정보</li>
					<li><span><a href="login.jsp">로그인</a></span></li>
					<li><span class="keyword"><a href="agree.jsp">회원가입</a></span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">회원가입</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>회원정보</span> <i class="arrow"
							style="background: url(image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>회원가입</span>
					</div>
				</div>

				<div class="shareContent">
					<div class="joinNav">
						<ul>
							<li class="keyNav">01. 약관동의<img
								src="image/joinStep_arrOn.png" alt="navicon"></li>
							<li>02. 회원 정보 입력<img src="image/joinStep_arr.png"
								alt="navicon"></li>
						</ul>
					</div>

					<form class="joinAgreeForm" action="join.jsp"
						onsubmit="return validateAgreements();">
						<div>
							<h2>
								이용약관<span>(필수)</span>
							</h2>
							<textarea rows="10">
제1장 총칙
이 약관은 화성시시립도서관의 회원 서비스 및 이용조건 . 절차에 관한 사항을 규정함을 목적으로 합니다.

제2장 회원가입과 서비스 이용
제1조 이용 계약의 성립
(1) 이용 계약은 개인의 이용 신청에 대하여 약관 내용에 대한 이용자의 동의 후 화성시립 도서관의 이용 응낙에 의해 성립됩니다.
(2) 회원에 가입하여 서비스를 이용하고자 하는 회원은 화성시시립도서관에서 요청하는 소정의 개인정보(반드시 실명)를 제공해야 합니다.
(3) 화성시립 도서관은 다음에 해당하는 회원가입신청에 대하여는 이를 응낙하지 아니하며, 올리신 글을 사전통보 없이 임의로 삭제할 수 있습니다.
① 다른 사람의 명의를 사용하여 신청하였을 때
② 회원가입 신청서의 내용을 허위로 기재(실명이 아니거나, 연락처로 연락이 안되는 경우)했을 경우
③ 일방적인 비방이나, 상업적인 용도의 글을 올리는 경우
제 2 조 서비스 이용
(1) 서비스 이용은 화성시립 도서관의 운영 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
(2) 회원은 게시판에 글을 올리고 열람할 수 있습니다.
제3장 책임
제1조 화성시 시립도서관의 의무
(1) 화성시립 도서관은 특별한 사정이 없는 한 이용자가 서비스를 신청한 날짜부터 이용할 수 있도록 합니다.
(2) 화성시립 도서관은 이용자의 개인정보 및 기업정보를 이용자의 승낙 없이 타인에게 누설, 배포하여서는 아니 됩니다.
제2조 회원의 의무
(1) 아이디와 비밀번호에 관한 모든 관리의 책임은 회원에게 있습니다.
(2) 등록된 회원은 본 약관에서 규정한 사항을 준수해야 합니다.
(3) 회원가입 신청시 허위 기재사항이 없어야 합니다(실명, 연락이 가능한 연락처)
제3조 개인정보의 보호
여기는 화성시시립도서관의 웹사이트입니다. 우리도서관 홈페이지의 이용에 대해 감사드리며, 홈페이지에서의 개인정보보호방침에 대하여 설명을 드리겠습니다. 이는 현행·공공기관의 개인정보보호에 관한법률 및 공공기관의 개인정보보호를 위한 기본지침에 근거를 두고 있습니다. 우리도서관에서 운영하고 있는 웹사이트는 다음과 같으며, 이 방침은 별도의 설명이 없는 한 우리도서관에서 운용하는 모든 웹사이트에 적용됨을 알려드립니다. www.hscitylib.or.kr, m.hscitylib.or.kr, ebook.hscitylib.or.kr 등
① 자동으로 수집·저장되는 개인정보
여러분이 우리도서관 홈페이지를 이용할 경우 다음의 정보는 자동적으로 수집·저장됩니다.
이용자 여러분의 인터넷서버 도메인과 우리 홈페이지를 방문할 때 거친 웹사이트의 주소
이용자의 브라우져 종류 및 OS
방문일시 등
위와 같이 자동 수집·저장되는 정보는 이용자 여러분에게 보다 나은 서비스를 제공하기 위해 홈페이지의 개선과 보완을 위한 통계분석, 이용자와 웹사이트 간의 원활한 의사소통 등을 위해 이용되어질 것입니다.
다만, 법령의 규정에 따라 이러한 정보를 제출하게 되어 있을 경우도 있다는 것을유념하시기 바랍니다.
② 이메일 및 웹 서식 등을 통한 수집 정보
이용자 여러분은 우편, 전화 또는 온라인 전자서식 등을 통한 전자적 방법을 통해 의사를 표시할 수 있습니다. 이러한 방법의 선택에 있어 몇 가지 유의사항을 알려드립니다.
여러분이 홈페이지에 기재한 사항은 다른 사람들이 조회 또는 열람할 수도 있습니다.
여러분이 기재한 사항은 관련 법규에 근거하여 필요한 다른 사람과 공유될 수 있으며, 관련법령의 시행과 정책개발의 자료로도 사용될 수 있습니다.
또한, 이러한 정보는 타 부처와 공유되거나, 필요에 의하여 제공될 수도 있습니다.
홈페이지 보안을 위해 관리적·기술적 노력을 하고 있으나, 만약의 침해사고 시 문제가 될 수 있는 민감한 정보의 기재는 피하여 주시기 바랍니다.
③ 웹사이트에서 운영하는 보안조치
홈페이지의 보안 또는 지속적인 서비스를 위해, 우리공사는 네트워크 트래픽의 통제(Monitor)는 물론 불법적으로 정보를 변경하는 등의 시도를 탐지하기 위해 여러 가지 프로그램을 운영하고 있습니다.
④ 링크 사이트·웹 페이지
화성시시립도서관이 운영하는 여러 웹페이지에 포함된 링크 또는 배너를 클릭하여 다른 사이트 또는 웹페이지로 옮겨갈 경우 개인정보보호방침은 그 사이트 운영기관이 게시한 방침이 적용됨으로 새로 방문한 사이트의 방침을 확인하시기 바랍니다.
⑤ 웹사이트 이용 중 다른 사람의 개인정보 취득
화성시시립도서관이 운영하는 웹사이트에서 이메일 주소 등 식별할 수 있는 개인정보를 취득하여서는 아니 됩니다. 사위 기타 부정한 방법으로 이러한 개인정보를 열람 또는 제공받은 자는 공공기관의 개인정보보호에 관한 법률 제23조의 규정에 의하여 처벌을 받을 수 있습니다.
⑥ 개인정보 침해사항의 신고
화성시시립도서관의 웹사이트 이용 중 개인정보의 유출 가능성 등 정보주체의 권익이 침해될 우려가 있는 사실을 발견하였을 경우는 다음의 연락처로 알려주시기 바랍니다.
화성시립도서관 개인정보보호담당자
이메일	lhj0610@hcf.or.kr	전화번호	031-8015-8284
주소	우) 445-896 화성시 노작로 134	팩스	031-8015-8289
[부 칙]
(시행일) 이 약관은 2005년 06월 01일부터 시행합니다.
(효 력) 본 약관은 이용자가 회원에 가입함과 동시에 효력을 발생합니다.
                            </textarea>
							<br />
							<div class="joinAgreeCheckBox">
								<label>이용약관에 동의합니다.</label> <input type="checkbox" id="agree1"
									onclick="">
							</div>
						</div>

						<div>
							<h2>
								개인정보 수집 및 이용 동의<span>(필수)</span>
							</h2>
							<textarea rows="10">
1) 수집 항복 및 수집방법
1.화성시통합도서관리시스템 (공공도서관표준자료관리시스템/화성시시립도서관홈페이지)
필수항목 : 성명, 주소, 휴대폰번호, 홈페이지 아이디, 홈페이지 비밀번호, 회원증 비밀번호
선택항목 : 집전화번호, 가족전화번호, 이메일주소
2.인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등
2) 수집 및 이용목적
1.화성시통합도서관리시스템 (공공도서관표준자료관리시스템/화성시시립도서관홈페이지)
회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별 · 인증, 회원자격 유지 · 관리, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의 여부 확인, 각종 고지 · 통지 등을 목적으로 개인정보를 처리합니다.
                                
2.도서관 서비스 제공
이용약관에 의해 도서관에서 제공하는 서비스(도서대출, 책이음서비스, 전자도서관, 전자정보자료실, DVD감상실)의 운영 및 안내 등의 목적으로 개인정보를 처리합니다.
                                
3.민원사무 처리
민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락 · 통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.
                                
3) 보유 및 이용기간
화성시시립도서관은 법령에 따른 개인정보 보유 · 이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유 · 이용기간 내에서 개인정보를 처리 · 보유합니다. 각각의 개인정보의 처리 및 보유 기간은 다음과 같습니다.
                                
1.홈페이지 회원 가입 및 관리 : 공공기관 홈페이지 탈퇴 시까지
1) 관계 법령 위반에 따른 수사 · 조사 등이 진행 중인 경우에는 해당 수사 · 조사 종료 시까지
2) 도서관 이용에 따른 채권 · 채무관계 잔존 시에는 해당 채권 · 채무관계 정산 시까지
2.도서관 서비스 제공 : 사물함이용, 문화강좌, 기타 도서관 관련 프로그램의 경우는 1년
3.민원사무 처리 : 민원처리 종료 후 3년
                            </textarea>
							<br />
							<div class="joinAgreeCheckBox">
								<label>개인정보 수집 및 이용에 동의합니다.</label> <input type="checkbox"
									id="agree2" onclick="">
							</div>
						</div>

						<div>
							<h2>
								개인정보 제3자 제공 동의<span>(선택)</span>
							</h2>
							<textarea rows="10">
화성시시립도서관은 고지하거나 동의한 범위를 초과하여 회원의 개인정보를 이용하거나 제3자에게 제공 또는 공개하지 않습니다. 다만 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

'화성시시립도서관'은 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

1.개인정보를 제공받는 자 : 국립중앙도서관
2.제공항목 : 성명, 회원번호, 주소, 연락처, 이메일, 대출도서명, 대출 도서권수, 회원의 대출상태 등
3.제공받는 자의 개인정보 이용목적 : 전국 참여도서관 책이음서비스 제공 (http://book.nl.go.kr)
4.제공받는 자의 보유 및 이용기간 : 5년
5.제공시기 : 정보주체의 책이음서비스 요청시 (정보변경 시)
                            </textarea>
							<br />
							<div class="joinAgreeCheckBox">
								<label>개인정보 제3자 제공에 동의합니다.</label> <input type="checkbox"
									id="agree3" onclick="">
							</div>
						</div>

						<input type="submit" value="다음 단계로 > " class="joinAgreeBtn">
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function validateAgreements() {
			const agree1 = document.getElementById('agree1');
			const agree2 = document.getElementById('agree2');

			if (!agree1.checked || !agree2.checked) {
				alert('필수사항에 동의해주세요.');
				return false; // 제출 방지
			}

			return true; // 폼 제출 허용
		}
	</script>

	<%@ include file="includes/footer.jsp"%>
</body>
</html>