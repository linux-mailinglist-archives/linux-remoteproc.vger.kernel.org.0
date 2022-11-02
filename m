Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86192616143
	for <lists+linux-remoteproc@lfdr.de>; Wed,  2 Nov 2022 11:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiKBKyC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 2 Nov 2022 06:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiKBKyB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Nov 2022 06:54:01 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE9023BCE;
        Wed,  2 Nov 2022 03:53:59 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A2Ah1a5031736;
        Wed, 2 Nov 2022 10:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MByp6rMy1qY59PVbGa7CT2M6UY74//OaD2ekZxzglrE=;
 b=BUA/oHf7T+ydspD9DHkFAkgeVHkZXB3SsR8RdI4Li3VbjyLqTgHwFbwVLuYWUieyZ+JG
 d2lkcj6MUEnqhVGtHnOR9JN9+Qm6kQSWPrql69yhHNT0GG8JHsOvhbMUdVZlrFslpK0F
 mQlMIaroxGJq7hiTF8xEKApjrkc6d0XqdGjEEjyT8aYKtBL+QK+/Q1w1JHG+AmepnLm4
 6tob2slREnNnpTatRtWn1CaaNga2F5+SD4o0d+C00JRSuZqYCYYja9bBGux4e9b4F68a
 ZZQpMisiasO4eHkx81sxY/Z4E8A2W+bO2kLRvFyH8gyULBIPvYyRBVdrC9HMeocB6W/j og== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kkj8x8k96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Nov 2022 10:53:55 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A2ArsG3009631
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 2 Nov 2022 10:53:54 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 2 Nov 2022
 03:53:52 -0700
Message-ID: <414aacb1-e68b-a9a7-3b99-12bc56494f6f@quicinc.com>
Date:   Wed, 2 Nov 2022 18:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4] remoteproc: core: do pm relax when in RPROC_OFFLINE
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_clew@quicinc.com>
References: <128dc161-8949-1146-bf8b-310aa33c06a8@quicinc.com>
 <1663312351-28476-1-git-send-email-quic_aiquny@quicinc.com>
 <20221012204344.GA1178915@p14s>
 <792f05fc-995e-9a87-ab7d-bee03f15bc79@quicinc.com>
 <20221013173442.GA1279972@p14s> <20221013180334.GB1279972@p14s>
 <8807a9a6-d93d-aef5-15f4-88648a6ecbe2@quicinc.com>
 <CANLsYkx8Vcha9FpfRvJEkq2pd+mSYFeZQBXj65YoiSBv+WEY4A@mail.gmail.com>
 <70828854-8427-8ce1-1535-e14261fd122d@quicinc.com>
 <420faf00-d59e-57c6-55a5-fae08a411517@foss.st.com>
 <CANLsYkw1Ex0TfmG-tRhHJgn3LsdvNhS_6HjJXn=ogwcCOWbH_A@mail.gmail.com>
From:   "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <CANLsYkw1Ex0TfmG-tRhHJgn3LsdvNhS_6HjJXn=ogwcCOWbH_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lEjzDBaAjqF_Tbzsw1nHzzHlFAToCqFW
X-Proofpoint-ORIG-GUID: lEjzDBaAjqF_Tbzsw1nHzzHlFAToCqFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_07,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020066
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Let me think about this carefully.

When in RPROC_RECOVERY_FAIL case we want to re-do the recovery process 
again or just leave the pm_relax?

recovery fail case 1:
|                                      |firstcrash interrupt issued
| second crashed interrupt issued      | rproc_report_crash()
| rproc_report_crash()                 |          pm_stay_awake()
|          pm_stay_awake()             |          queue_work()
|          queue_work()                |rproc_crash_handler_work()
|                                      |mutex_lock(&rproc->lock);
|                                      |rproc_stop()
|rproc_crash_handler_work()            |rproc->state = RPROC_OFFLINE;
|                                      |RPROC_RECOVERY_FAIL //new
|                                      |mutex_unlock(&rproc->lock);
|mutex_lock(&rproc->lock);             |pm_relax()
|if (rproc->state == RPROC_OFFLINE)    |
|return // shouldn't do pm_relax if RPROC_RECOVERY_FAIL?  |
|mutex_unlock(&rproc->lock);           |
|                                      |
|                                      |
|                                      |

recovery fail case 2:
|                                      |firstcrash interrupt issued
|                                      | rproc_report_crash()
|                                      |          pm_stay_awake()
|                                      |          queue_work()
|                                      |rproc_crash_handler_work()
|                                      |mutex_lock(&rproc->lock);
|                                      |rproc_stop()
|                                      |rproc->state = RPROC_OFFLINE;
|                                      |RPROC_RECOVERY_FAIL //new
|                                      |mutex_unlock(&rproc->lock);
|                                      |pm_relax()
|
| second crashed interrupt issued      |
| rproc_report_crash()                 |
|          pm_stay_awake()             |
|          queue_work()                |
|pm_stay_awake()
|mutex_lock(&rproc->lock);
|if (rproc->state == RPROC_OFFLINE)    |
|return // still need do pm_relax if RPROC_RECOVERY_FAIL?  |
|mutex_unlock(&rproc->lock);           |
|                                      |
|                                      |
|                                      |

Maybe I can have:
1. the pm_stay_awake and pm_relax with count based and call with paired 
for fix current concurency issue.
2. RPROC_RECOVERY_FAIL can be another patch for continue try to do 
recovery work.
3. handle RPROC_DETACHED case.

On 11/2/2022 4:11 AM, Mathieu Poirier wrote:
> On Fri, 28 Oct 2022 at 09:31, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hi,
>>
>> On 10/24/22 05:17, Aiqun(Maria) Yu wrote:
>>> On 10/22/2022 3:34 AM, Mathieu Poirier wrote:
>>>> On Wed, 19 Oct 2022 at 23:52, Aiqun(Maria) Yu <quic_aiquny@quicinc.com> wrote:
>>>>>
>>>>> On 10/14/2022 2:03 AM, Mathieu Poirier wrote:
>>>>>> On Thu, Oct 13, 2022 at 11:34:42AM -0600, Mathieu Poirier wrote:
>>>>>>> On Thu, Oct 13, 2022 at 09:40:09AM +0800, Aiqun(Maria) Yu wrote:
>>>>>>>> Hi Mathieu,
>>>>>>>>
>>>>>>>> On 10/13/2022 4:43 AM, Mathieu Poirier wrote:
>>>>>>>>> Please add what has changed from one version to another, either in a cover
>>>>>>>>> letter or after the "Signed-off-by".  There are many examples on how to
>>>>>>>>> do that
>>>>>>>>> on the mailing list.
>>>>>>>>>
>>>>>>>> Thx for the information, will take a note and benefit for next time.
>>>>>>>>
>>>>>>>>> On Fri, Sep 16, 2022 at 03:12:31PM +0800, Maria Yu wrote:
>>>>>>>>>> RPROC_OFFLINE state indicate there is no recovery process
>>>>>>>>>> is in progress and no chance to do the pm_relax.
>>>>>>>>>> Because when recovering from crash, rproc->lock is held and
>>>>>>>>>> state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
>>>>>>>>>> and then unlock rproc->lock.
>>>>>>>>>
>>>>>>>>> You are correct - because the lock is held rproc->state should be set to
>>>>>>>>> RPROC_RUNNING
>>>>>>>>> when rproc_trigger_recovery() returns.  If that is not the case then
>>>>>>>>> something
>>>>>>>>> went wrong.
>>>>>>>>>
>>>>>>>>> Function rproc_stop() sets rproc->state to RPROC_OFFLINE just before
>>>>>>>>> returning,
>>>>>>>>> so we know the remote processor was stopped.  Therefore if rproc->state
>>>>>>>>> is set
>>>>>>>>> to RPROC_OFFLINE something went wrong in either request_firmware() or
>>>>>>>>> rproc_start().  Either way the remote processor is offline and the system
>>>>>>>>> probably
>>>>>>>>> in an unknown/unstable.  As such I don't see how calling pm_relax() can help
>>>>>>>>> things along.
>>>>>>>>>
>>>>>>>> PROC_OFFLINE is possible that rproc_shutdown is triggered and successfully
>>>>>>>> finished.
>>>>>>>> Even if it is multi crash rproc_crash_handler_work contention issue, and
>>>>>>>> last rproc_trigger_recovery bailed out with only
>>>>>>>> rproc->state==RPROC_OFFLINE, it is still worth to do pm_relax in pair.
>>>>>>>> Since the subsystem may still can be recovered with customer's next trigger
>>>>>>>> of rproc_start, and we can make each error out path clean with pm resources.
>>>>>>>>
>>>>>>>>> I suggest spending time understanding what leads to the failure when
>>>>>>>>> recovering
>>>>>>>>> from a crash and address that problem(s).
>>>>>>>>>
>>>>>>>> In current case, the customer's information is that the issue happened when
>>>>>>>> rproc_shutdown is triggered at similar time. So not an issue from error out
>>>>>>>> of rproc_trigger_recovery.
>>>>>>>
>>>>>>> That is a very important element to consider and should have been mentioned
>>>>>>> from
>>>>>>> the beginning.  What I see happening is the following:
>>>>>>>
>>>>>>> rproc_report_crash()
>>>>>>>            pm_stay_awake()
>>>>>>>            queue_work() // current thread is suspended
>>>>>>>
>>>>>>> rproc_shutdown()
>>>>>>>            rproc_stop()
>>>>>>>                    rproc->state = RPROC_OFFLINE;
>>>>>>>
>>>>>>> rproc_crash_handler_work()
>>>>>>>            if (rproc->state == RPROC_OFFLINE)
>>>>>>>                    return // pm_relax() is not called
>>>>>>>
>>>>>>> The right way to fix this is to add a pm_relax() in rproc_shutdown() and
>>>>>>> rproc_detach(), along with a very descriptive comment as to why it is needed.
>>>>>>
>>>>>> Thinking about this further there are more ramifications to consider.  Please
>>>>>> confirm the above scenario is what you are facing.  I will advise on how to
>>>>>> move
>>>>>> forward if that is the case.
>>>>>>
>>>>> Not sure if the situation is clear or not. So resend the email again.
>>>>>
>>>>> The above senario is what customer is facing. crash hanppened while at
>>>>> the same time shutdown is triggered.
>>>>
>>>> Unfortunately this is not enough details to address a problem as
>>>> complex as this one.
>>>>
>>>>> And the device cannto goes to suspend state after that.
>>>>> the subsystem can still be start normally after this.
>>>>
>>>> If the code flow I pasted above reflects the problem at hand, the
>>>> current patch will not be sufficient to address the issue.  If Arnaud
>>>> confirms my suspicions we will have to think about a better solution.
>>>>
>>>
>>> Hi Mathiew,
>>>
>>> Could you pls have more details of any side effects other then power issue of
>>> the current senario?
>>> Why the current patch is not sufficient pls?
>>>
>>>
>>> Have the current senario in details with rproc->lock information in details:
>>>
>>> | subsystem crashed interrupt issued      | user trigger shutdown
>>> | rproc_report_crash()                    |
>>> |          pm_stay_awake()                |
>>> |          queue_work()                   |
>>> |                                         |rproc_shutdown
>>> |                                         |mutex_lock(&rproc->lock);
>>> |                                         |rproc_stop()
>>> |rproc_crash_handler_work()               |rproc->state = RPROC_OFFLINE;
>>> |                                         |mutex_unlock(&rproc->lock);
>>> |mutex_lock(&rproc->lock);                |
>>> |if (rproc->state == RPROC_OFFLINE)       |
>>> |return // pm_relax() is not called       |rproc_boot
>>> |mutex_unlock(&rproc->lock);              |
>>> |                                         |mutex_lock(&rproc->lock);
>>> |                                         |rproc_start()
>>> |                                         |mutex_unlock(&rproc->lock);
>>>
>>>
>>
>> Agree with Mathieu, this is not so simple.
>>
> 
> Thanks for looking into this.
> 
>> Here is my view  hoping I haven't missed a point in your discussion or
>> an other corner cases.
>>
>> I tried to analyze the issues (in what follows, the term "condition" means
>> the "if" condition in which Aiqun proposes to add the fix) :
>>
>> I can see 4 use cases with race condition
>>
>> 1) crash report while already one is treated (rproc_boot_recovery called)
>>       => not a real use case as if the remote processor is crashed we
>>                should not have a second crash report
>>
> 
> That part is of great concern to me.  *Theoretically* we should not
> get a new crash report while one has already been dispatched but the
> current code accounts for this scenario and as such the possibility
> can't be dismissed.  Therefore we need to expect rproc_report_crash()
> to be called multiple times before a single instance of
> rproc_boot_recovery() is scheduled.


> 
>> 2) rproc_stop executed between the queuing of the crash work and the call of
>>    rproc_crash_handler_work
>>     => rproc->state = RPROC_OFFLINE
>>     => we enter in the "condition" and the pm_relax has to be called
>>     => This commit fix should solve this use case
>>
>> 3) rproc_detach executed between the queue of the crash work and the call of
>>    rproc_crash_handler_work
>>     => rproc->state = RPROC_DETACHED;
>>     => we don't go in "the condition" and issue because the recovery reattach
>>        to the remote processor
>>     => but pm_relax is called
>>     => probably need an extra fix to avoid to re-attach
>>
>> 4) crash report while already one is treated (rproc_attach_recovery called)
>>     this one corresponds to an auto reboot of the remote processor, with a
>>     new crash
>>     => rproc->state = RPROC_CRASHED or rproc->state = RPROC_DETACHED;
>>     4)a) rproc->state = RPROC_CRASHED if rproc->recovery_disabled = true
>>          => should call pm_relax if rproc->recovery_disabled = true
>>          => commit does not work for this use case
>>
>>     4)b) rproc->state = RPROC_DETACHED if recovery fails
>>         => error case with an unstable state
>>         => how to differentiate it from the use case 3) ?
>>         => introduce a RPROC_RECOVERY_FAIL state?
>>
> 
> The case where a recovery fails needs to be considered and is the
> reason the original patch doesn't work.  Right now in
> rproc_crash_handler_work(), it is not possible to differentiate
> between a legitimate shutdown request (scenario #2 above) and a
> recovery that went wrong.  I think introducing RPROC_RECOVERY_FAIL
> would greatly simplify things.
> 
> My initial evaluation had not considered the attach/detach scenarios -
> thanks for adding that in the mix.
> 
> Aiqun, please send a new patchset that adds a new remote processor
> state, i.e RPROC_RECOVERY_FAIL.  There should also be another patch in
> that set that takes attach/detach scenarios into account.  The code
> between the v6.0 and v6.1 cycle has changed a lot in that area so make
> sure to properly rebase.
> 
I will try.

>>
>> Then pm_stay_awake is called when the crash work is queued.
>> It seems to me coherent to call the pm_relax in the work handler.
>>
>>
>>
>> Here is a quick and dirty patch (not tested) that should take into account the
>> main use cases ( except 1) and 4)b) )
>>
>> @@ -2009,8 +2009,18 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>
>>          mutex_lock(&rproc->lock);
>>
>> -       if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
>> +       if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE ||
>> +           rproc->state == RPROC_DETACHED) {
>>                  /* handle only the first crash detected */
>> +
>> +               /*
>> +                * call pm-relax in following use cases:
>> +                * - the remote processor has been stopped by the user
>> +                * - the remote processor is detached
>> +                + - the remote proc has an autonomous reset but recovery_disabled is true.
>> +                */
>> +               if(rproc->state != RPROC_CRASHED || rproc->recovery_disabled)
>> +                       pm_relax(rproc->dev.parent);
>>                  mutex_unlock(&rproc->lock);
>>                  return;
>>          }
>>
>> Regards,
>> Arnaud
>>
>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Mathieu
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> When the state is in RPROC_OFFLINE it means separate request
>>>>>>>>>> of rproc_stop was done and no need to hold the wakeup source
>>>>>>>>>> in crash handler to recover any more.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/remoteproc/remoteproc_core.c | 11 +++++++++++
>>>>>>>>>>      1 file changed, 11 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>>>>>>>>> b/drivers/remoteproc/remoteproc_core.c
>>>>>>>>>> index e5279ed9a8d7..6bc7b8b7d01e 100644
>>>>>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>>>>>> @@ -1956,6 +1956,17 @@ static void rproc_crash_handler_work(struct
>>>>>>>>>> work_struct *work)
>>>>>>>>>>             if (rproc->state == RPROC_CRASHED || rproc->state ==
>>>>>>>>>> RPROC_OFFLINE) {
>>>>>>>>>>                     /* handle only the first crash detected */
>>>>>>>>>>                     mutex_unlock(&rproc->lock);
>>>>>>>>>> +         /*
>>>>>>>>>> +          * RPROC_OFFLINE state indicate there is no recovery process
>>>>>>>>>> +          * is in progress and no chance to have pm_relax in place.
>>>>>>>>>> +          * Because when recovering from crash, rproc->lock is held and
>>>>>>>>>> +          * state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
>>>>>>>>>> +          * and then unlock rproc->lock.
>>>>>>>>>> +          * RPROC_OFFLINE is only an intermediate state in recovery
>>>>>>>>>> +          * process.
>>>>>>>>>> +          */
>>>>>>>>>> +         if (rproc->state == RPROC_OFFLINE)
>>>>>>>>>> +                 pm_relax(rproc->dev.parent);
>>>>>>>>>>                     return;
>>>>>>>>>>             }
>>>>>>>>>> --
>>>>>>>>>> 2.7.4
>>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> Thx and BRs,
>>>>>>>> Aiqun(Maria) Yu
>>>>>
>>>>>
>>>>> --
>>>>> Thx and BRs,
>>>>> Aiqun(Maria) Yu
>>>
>>>


-- 
Thx and BRs,
Aiqun(Maria) Yu
