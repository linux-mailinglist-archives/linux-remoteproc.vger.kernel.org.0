Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85AF173353
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 09:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgB1Iw0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 03:52:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48562 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgB1Iw0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 03:52:26 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 96CD9292A95
Subject: Re: [PATCH] platform/chrome: cros_ec_rpmsg: Fix race with host event.
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        open list <linux-kernel@vger.kernel.org>, ohad@wizery.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org
References: <20200214082638.92070-1-pihsun@chromium.org>
 <83b03af1-5518-599a-3f82-ee204992edbf@collabora.com>
 <CANdKZ0fuK1Nm_fPNKAss29pqghCcwjN3acYHi6Ez5==envgKgA@mail.gmail.com>
 <84a66ac1-c36a-fa72-a406-9c3396c1bdf2@collabora.com>
Message-ID: <6c78727d-8a65-097d-224d-48d93f6ceaa7@collabora.com>
Date:   Fri, 28 Feb 2020 09:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <84a66ac1-c36a-fa72-a406-9c3396c1bdf2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Pi-Hsun,

On 17/2/20 16:55, Enric Balletbo i Serra wrote:
> Dear remoteproc experts,
> 
> cc'ing you for if we can have your feedback on this change.
> 
> Thanks Pi-Hsun, for your quick answer, makes sense but I'm still feeling that I
> miss something (probably because I'm not a remoteproc expert), so I added the
> Remoteproc people for if they can comment this patch. We have time as we're in
> rc2 only, so I'd like to wait a bit in case they can take a look.
> 
> If no answer is received I'll take a second look and apply the patch.
> 

I'll pick this patch, just I want to request a minor change.

> Thanks,
>  Enric
> 
> On 15/2/20 4:56, Pi-Hsun Shih wrote:
>> Hi Enric,
>>
>> On Fri, Feb 14, 2020 at 11:10 PM Enric Balletbo i Serra
>> <enric.balletbo@collabora.com> wrote:
>>>
>>> Hi Pi-Hsun,
>>>
>>> On 14/2/20 9:26, Pi-Hsun Shih wrote:
>>>> Host event can be sent by remoteproc by any time, and
>>>> cros_ec_rpmsg_callback would be called after cros_ec_rpmsg_create_ept.
>>>> But the cros_ec_device is initialized after that, which cause host event
>>>> handler to use cros_ec_device that are not initialized properly yet.
>>>>
>>>
>>> I don't have the hardware to test but, can't we call first cros_ec_register and
>>> then cros_ec_rpmsg_create_ept?
>>>
>>> Start receiving driver callbacks before finishing to probe the drivers itself
>>> sounds weird to me.
>>>
>>> Thanks,
>>>  Enric
>>
>> Since cros_ec_register calls cros_ec_query_all, which sends message to
>> remoteproc using cros_ec_pkt_xfer_rpmsg (to query protocol version),
>> the ec_rpmsg->ept need to be ready before calling cros_ec_register.
>>
>>>
>>>> Fix this by don't schedule host event handler before cros_ec_register
>>>> returns. Instead, remember that we have a pending host event, and
>>>> schedule host event handler after cros_ec_register.
>>>>
>>>> Fixes: 71cddb7097e2 ("platform/chrome: cros_ec_rpmsg: Fix race with host command when probe failed.")
>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>> ---
>>>>  drivers/platform/chrome/cros_ec_rpmsg.c | 16 +++++++++++++++-
>>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
>>>> index dbc3f5523b83..7e8629e3db74 100644
>>>> --- a/drivers/platform/chrome/cros_ec_rpmsg.c
>>>> +++ b/drivers/platform/chrome/cros_ec_rpmsg.c
>>>> @@ -44,6 +44,8 @@ struct cros_ec_rpmsg {
>>>>       struct completion xfer_ack;
>>>>       struct work_struct host_event_work;
>>>>       struct rpmsg_endpoint *ept;
>>>> +     bool has_pending_host_event;
>>>> +     bool probe_done;


Could you try if just calling driver_probe_done() when needed works, so we don't
need to add a new boolean flag for this?

Thanks,
 Enric

>>>>  };
>>>>
>>>>  /**
>>>> @@ -177,7 +179,14 @@ static int cros_ec_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>>>>               memcpy(ec_dev->din, resp->data, len);
>>>>               complete(&ec_rpmsg->xfer_ack);
>>>>       } else if (resp->type == HOST_EVENT_MARK) {
>>>> -             schedule_work(&ec_rpmsg->host_event_work);
>>>> +             /*
>>>> +              * If the host event is sent before cros_ec_register is
>>>> +              * finished, queue the host event.
>>>> +              */
>>>> +             if (ec_rpmsg->probe_done)
>>>> +                     schedule_work(&ec_rpmsg->host_event_work);
>>>> +             else
>>>> +                     ec_rpmsg->has_pending_host_event = true;
>>>>       } else {
>>>>               dev_warn(ec_dev->dev, "rpmsg received invalid type = %d",
>>>>                        resp->type);
>>>> @@ -240,6 +249,11 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>               return ret;
>>>>       }
>>>>
>>>> +     ec_rpmsg->probe_done = true;
>>>> +
>>>> +     if (ec_rpmsg->has_pending_host_event)
>>>> +             schedule_work(&ec_rpmsg->host_event_work);
>>>> +
>>>>       return 0;
>>>>  }
>>>>
>>>>
>>>> base-commit: b19e8c68470385dd2c5440876591fddb02c8c402
>>>>
