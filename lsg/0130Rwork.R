result <- read.csv("C:/Users/minir/OneDrive/바탕 화면/지치안/kp2020.csv")
View(result)
str(result)

library(dplyr) # 데이터프레임 수정을 위한 라이브러리
result2 <-result #복사본 만들기
result2 <-rename(result2, 접수부서코드=RECV_DEPT_NM, 접수완료일시=RECV_CPLT_DM, 
                 경찰청구분=NPA_CL,
                 사건상태코드 = EVT_STAT_CD, 사건종별코드=EVT_CL_CD,
                 신고성별=RPTER_SEX, 발생지점=HPPN_PNU_ADDR,
                 발생좌표x=HPPN_X,발생좌표y=HPPN_Y, 동일사건여부=SME_EVT_YN)
str(result2)
dj20<-result2 %>% filter(result2$접수부서코드=="대전청")
cn20<-result2 %>% filter(result2$접수부서코드=="충남청")

dj_target<-dj20 %>%filter(dj20$사건종별코드==401|dj20$사건종별코드==406)
cn_target<-cn20 %>%filter(cn20$사건종별코드==401|cn20$사건종별코드==406)

library(stringr)
adr<-dj_target$발생지점
split_result<-str_split(adr, " ")
split_result <- word(split_result, 2)
split_result("[가-힣]구")

# 구별 발생 현황을 알고싶었음....

대전/ 충남청 + 사건종별 코드 401,406
주소에서 구 추출해서 구별 발생현황


