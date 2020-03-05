Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1AD217ADA0
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Mar 2020 18:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgCERye (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Mar 2020 12:54:34 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:45340 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgCERye (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Mar 2020 12:54:34 -0500
Received: by mail-io1-f67.google.com with SMTP id w9so7412750iob.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2020 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nWP6NJ5Ufnl/Qfwtyeq+O8joFfs1L0Y4YDlGJGw2HAo=;
        b=z7S+oDI+x6CnRYCgv92/5OnTRsGdpp+y0t3e9oT0oJ/0BeDDJdVS9juXISjgw851gm
         GGacPtojUoWQbfZ52pcikVXqGlB2VRO/fKMhYQTD8oWTTfFPhtb7xXXB8WyHznS25jWy
         yv5oCb7CwJ2XoT8GMacjXi0cAGkhZcb9cTYw/3X1/hGYOqcsuYzvjWFQ1S4SeyEKuFNY
         CmWwSw8emOAuD0yxmqR0DmUIiwjPHTaIGm+1dZ80F28Qj0ckaLydGJE+vDGd851gonG/
         49t7i6mWE2mtVf06RGJAShRIKbpdzNzU3lEdkNO+AyffD2WWiKWcd7ww865xl7BcwvBL
         xIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWP6NJ5Ufnl/Qfwtyeq+O8joFfs1L0Y4YDlGJGw2HAo=;
        b=hDDlbxFBR82UhAaPyCDUagtwTwXTu259yTocCXymQWrNG2wbbGW4+r99V2+OpdT5Yz
         HfmPf1m1aZ5a7ZizluFr34nXlgXsmq00/dbO+XaevuyKcbZoGBoPlkepiIIKm7zxKSoH
         /dQsapmNWIhpgTkLPPURQ3I7wWZep28QANbJg7pL4c7vEc5ISd3GGZQCQKsj2xxUQ9uW
         r8bM+PxLnd54RA7cM/qNHaV6KG87kbik/WTPl8JN/EHh63EnR8HkdHy+W/XWpXlZbC9Z
         n+8n7Z18HTd03YPWpGyXk74JrdA+2lzM7ghjFvdT2HPthDTPOXF76OGoEtd8eRV9SGNA
         TCkg==
X-Gm-Message-State: ANhLgQ1jlG8Xu/JvQ4yHsI4d+AgoDeL8GRtebDE0Qvr4kCspB2BFYiYw
        lX7fuK+0vsxAbENlKTuhEdhNPlMCdEcAwhXrKj0Jpw==
X-Google-Smtp-Source: ADFU+vt/zBlELi1bLdW+KjbrwUUGrSXJOGD1C1rzpYL6NqnOhhJywlgeLDkLobXKBOoTHfrNdD3BifjP1rQvlXDxd7w=
X-Received: by 2002:a05:6638:44a:: with SMTP id r10mr8443557jap.36.1583430873469;
 Thu, 05 Mar 2020 09:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com> <CANLsYkzPROdphvmtpZ6YiajZ2dYLrojC-rGYkq4jK2yzTnAJ5A@mail.gmail.com>
 <264561583429111@sas1-438a02fc058e.qloud-c.yandex.net>
In-Reply-To: <264561583429111@sas1-438a02fc058e.qloud-c.yandex.net>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 5 Mar 2020 10:54:22 -0700
Message-ID: <CANLsYkxj=1o8Y0V0WedbVirj9seZSArWeCvQvwk+N7wZa2_hPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: dummy kick method
To:     nikita.shubin@maquefel.me
Cc:     Nikita Shubin <nshubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 5 Mar 2020 at 10:29, <nikita.shubin@maquefel.me> wrote:
>
>
>
> 05.03.2020, 19:17, "Mathieu Poirier" <mathieu.poirier@linaro.org>:
> > On Wed, 4 Mar 2020 at 07:25, Nikita Shubin <NShubin@topcon.com> wrote:
> >>  add kick method that does nothing, to avoid errors in rproc_virtio_notify.
> >>
> >>  Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> >>  ---
> >>   drivers/remoteproc/imx_rproc.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >>  diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >>  index 3e72b6f38d4b..796b6b86550a 100644
> >>  --- a/drivers/remoteproc/imx_rproc.c
> >>  +++ b/drivers/remoteproc/imx_rproc.c
> >>  @@ -240,9 +240,15 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> >>          return va;
> >>   }
> >>
> >>  +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> >>  +{
> >>  +
> >>  +}
> >>  +
> >
> > If rproc::kick() is empty, how does the MCU know there is packets to
> > fetch in the virtio queues?
>
> Well, of course it doesn't i understand this perfectly - just following documentation citing:
>
> | Every remoteproc implementation should at least provide the ->start and ->stop
> | handlers. If rpmsg/virtio functionality is also desired, then the ->kick handler
> | should be provided as well.
>
> But i as i mentioned in "remoteproc: Fix NULL pointer dereference in rproc_virtio_notify" kick method will be called if
> "resource_table exists in firmware and has "Virtio device entry" defined" anyway, the imx_rproc is not in control of what
> exactly it is booting, so such situation can occur.

If I understand correctly, the MCU can boot images that have a virtio
device in its resource table and still do useful work even if the
virtio device/rpmsg bus can't be setup - is this correct?

Thanks,
Mathieu

>
> >
> >>   static const struct rproc_ops imx_rproc_ops = {
> >>          .start = imx_rproc_start,
> >>          .stop = imx_rproc_stop,
> >>  + .kick = imx_rproc_kick,
> >>          .da_to_va = imx_rproc_da_to_va,
> >>   };
> >>
> >>  --
> >>  2.24.1
