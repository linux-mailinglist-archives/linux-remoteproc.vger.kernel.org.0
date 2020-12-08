Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45722D2C88
	for <lists+linux-remoteproc@lfdr.de>; Tue,  8 Dec 2020 15:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbgLHOEY (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 8 Dec 2020 09:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbgLHOEX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Dec 2020 09:04:23 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4281C0613D6
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Dec 2020 06:03:43 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id z9so11955120qtn.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Dec 2020 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qGakVdCw5QYE//gz30LSIclGvqsDhnmw0oMI5x6lLuQ=;
        b=E/xtGCV68XO2lDrxqtkeFJy3TqmsWvpSWNHFR6+Il8UYsQXY8BSJb3UOYhwtGSXH+s
         Vthej7B9BmrAIS484t2wLTDWnIbScnD6bq3QXy1jB0VrCq/TQfL2ef8c+mOklWD3Fd1f
         L2OEuZNAavpYc3JQx/1Tt1qeNSr9j36j0M0RvTlHrAj/mcUQXdhZsR3zNlpO8fLLT+Ku
         N9k8af29CduZ94sAwbOn+Kq+UTCX6gIBYyFliCWfmkxKyH+isnz7HHp0r4V9B5sLWe9C
         QbQ5Y2QqGb2+Ojgcn3EQMJOcPUoo/QGBibQw4SnX+jisq4XXFOIWOf+OLj3FMJNsvqi5
         O2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qGakVdCw5QYE//gz30LSIclGvqsDhnmw0oMI5x6lLuQ=;
        b=RhQsfqSytk185hrwY+1Vp5/V823KyIJcCfTG8wIo6w9oIwf8IKGOB8PkPWeFZPZsF+
         gD2s4hV290EVsAWxFPjSOXdtQYkdDfU7UwX9LJvawsKyzvWIKO3IgbfnWzD1mF1JGKUT
         NgWn/pq9lHnXnNm2Hp6LmB9e1gkV7lySpwHRBQrTUWbkSpI5I1HJ7tct/sTmeVpauYtK
         R0w3a9dClMzcgEjfEPShuiLXWqqE4ZuUm2p95Rn1K2IPBc6YqA67/t3g0nIXfnRF430W
         u9SHR/4h/iQJrtfBJIBzY9ZOjU/wHiHBnOCo/JH7be3hElqEB/W3bJKQQcYWl4X9gmQy
         8gyA==
X-Gm-Message-State: AOAM532NExZXvHqDo1MkVndfhuqz/4Lk7CSfUM+UyhNRaVmeL39BsRWK
        j5avcSqUZQ+1M94X+FwZh7wm/3AXgxSCh87krW1vpQ==
X-Google-Smtp-Source: ABdhPJzwJcU+8YDkuOryWUOx1yXx3QATsUaPN1cy3ssbkdgjWnq5iNuGCnPDsunfOudRYLgqbw2w1AxdVdNmcKRt4uU=
X-Received: by 2002:ac8:6b9a:: with SMTP id z26mr30901677qts.200.1607436222731;
 Tue, 08 Dec 2020 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
 <20201204201807.14716-4-grzegorz.jaszczyk@linaro.org> <20201207173731.GA1509079@xps15>
In-Reply-To: <20201207173731.GA1509079@xps15>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Tue, 8 Dec 2020 15:03:32 +0100
Message-ID: <CAMxfBF6UVBkM_oV=oO0H+2VXxRjwp9ggLLrxQvSyg+VVOzPwTQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] remoteproc: pru: Add support for PRU specific
 interrupt configuration
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

On Mon, 7 Dec 2020 at 18:37, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:

[...]

> > +static int pru_handle_intrmap(struct rproc *rproc)
> > +{
> > +     struct device *dev = rproc->dev.parent;
> > +     struct pru_rproc *pru = rproc->priv;
> > +     struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> > +     struct irq_fwspec fwspec;
> > +     struct device_node *irq_parent;
> > +     int i, ret = 0;
> > +
> > +     /* not having pru_interrupt_map is not an error */
> > +     if (!rsc)
> > +             return 0;
> > +
> > +     /* currently supporting only type 0 */
> > +     if (rsc->type != 0) {
> > +             dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (rsc->num_evts > MAX_PRU_SYS_EVENTS)
> > +             return -EINVAL;
> > +
> > +     if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> > +         pru->pru_interrupt_map_sz)
> > +             return -EINVAL;
> > +
> > +     pru->evt_count = rsc->num_evts;
> > +     pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
>
> sizeof(unsigned int)

Sure, I will post v4 addressing this comment and sorry for missing that.

Thank you,
Grzegorz
