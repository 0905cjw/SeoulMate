![seoulmate_logo](https://user-images.githubusercontent.com/26404182/122573257-8b3c1680-d089-11eb-8434-2e61e29a34f1.png)
# 프로젝트 : 쉐어하우스&하우스메이트 매칭 웹서비스
<pre>* 목적 : 공용 주거공간에서 거주하고자하는 사람과 거주자가 필요한 쉐어하우스 간 매칭 플랫폼
* 개발 기간 : 2021.04.15 ~ 2021.05.25
* 메인 기능 : 매칭 시스템
* 서브 기능 : 회원(사용자/관리자), 자주하는 질문(사용자/관리자)</pre>
https://user-images.githubusercontent.com/26404182/122573376-b292e380-d089-11eb-8e4f-61112500df68.mp4
<pre>* 기능 설명
- 매칭 시스템
: 프리미엄 회원에 한해 자신의 특정 성향과 매칭할 대상의 매칭 점수를 출력
<h3>매칭 이전의 필수 조건</h3>
1.회원의 성별과 희망 성별은 서로 다를 수 없다.   
<h3>매칭의 조건</h3>
1.매칭 목록은 프리미엄인 회원에게만 보여준다.   
2.프리미엄인 메이트에게만 현재 모집중 상태인 하우스의 목록을 매칭순으로 정렬하여 보여준다.   
3.반대로 프리미엄인 하우스에게만 현재 모집중 상태인 메이트의 매칭된 목록을 매칭순으로 정렬하여 보여준다.   
4.성별   
*아래의 조건은 성별(희망 성별) / 희망 성별로 구분한다.

메이트에게 보여줄 하우스의 목록
     메이트                     하우스
4-1.여자(여자)        →    여자   
4-2.남자(남자)        →    남자   
4-3.여자(상관없음)    →    여자 또는 상관없음   
4-4.남자(상관없음)    →    남자 또는 상관없음   

*아래의 조건은 희망 성별 / 성별(희망 성별)로 구분한다.

하우스에게 보여줄 메이트의 목록
     메이트                     하우스
4-5.여자              →    여자, 여자(상관없음)
4-6.남자              →    남자, 남자(상관없음)
4-7.상관없음          →    상관없음
</pre>
<pre>
<h3>쿼리문 짜는 순서</h3>
4-1과 4-2의 공통점은 자신의 성별과 희망 성별이 같다는 것이다.
모집중인 하우스의 희망 성별과 메이트의 성별이 같은 하우스 목록을 선택한다.

4-3과 4-4는 4-1, 4-2의 조건에 상관없음이 들어가기만 하면 되기 때문에
희망 성별이 상관없음인 하우스의 목록을 더해주면 된다.

4-5와 4-6은 하우스의 희망 성별인 사람만 필요하기 때문에 메이트의 희망 성별을 고려하지 않고 오로지 성별만으로 선택하면 된다.

4-7은 희망 성별이 상관없음인 메이트만 선택해야 한다.

⑴성별과 희망 성별로 걸러내고 각각 등록된 메이트 또는 하우스의 글이 모집중인 상태일 때만 선택되게 다시 한 번 조건을 걸어준다.

⑵매칭이 될 자신의 성향과 상대의 성향들을 full outer join을 하여 선택된 목록들의 성향에 자신의 성향을 이어준다.

⑶중복되는 필드끼리 값을 빼고 절댓값을 씌운다.(점수는 -가 나올 수 없기 때문) 성향의 연산이 3-3=0이 되면 성향이 잘 맞는다는 뜻이다.

⑷최저 점수인 32점을 0%으로, 최고 점수인 0점을 100%로 두고 100-n%에 100/32를 한 3.125를 곱해주면 매칭 점수가 환산된다.
어느 상대의 매칭 점수가 n%인지, 사진은 무얼 띄워주어야 하는지 등등 필요한 정보들을 위해 쿼리문의 안쪽부터 값을 가져와 구현하였다.
</pre>
### 하우스 목록
### 프리미엄 회원인 메이트에게 보여줄 매칭된 하우스의 목록
!@#@!#@!#사진
<pre>
-- 상관있음을 선택한 메이트(하우스 목록 조건)
select * from propensity where pcase='h' and housename is not null and m_gender=(select  pm.gender from member pm 
join (select userid, m_gender, pcase 
from propensity) p on pm.userid=p.userid and pm.gender=p.m_gender and pcase='m' and pm.userid=#{param1}) -- 메이트인 자신의 아이디

-- 상관없음을 선택한 메이트(하우스 목록 조건)
select * from propensity where pcase='h' and housename is not null and m_gender=(select pm.gender 
from member pm 
JOIN (select userid, m_gender, pcase from propensity) p 
on pm.userid=p.userid and m_gender=2 and pcase='m' and pm.userid=#{param1}) or (m_gender=2 and housename is not null)
</pre>
### 메이트에게 보여줄 최신 하우스의 목록

