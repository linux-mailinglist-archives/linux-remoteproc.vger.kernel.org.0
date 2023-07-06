Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D974A2FF
	for <lists+linux-remoteproc@lfdr.de>; Thu,  6 Jul 2023 19:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjGFRUJ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 6 Jul 2023 13:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjGFRUI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 Jul 2023 13:20:08 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1C21BF1
        for <linux-remoteproc@vger.kernel.org>; Thu,  6 Jul 2023 10:20:07 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55ba895d457so574576a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Jul 2023 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688664007; x=1691256007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9ea0Od7Ss8KSCo0Ba6GtQFVksMPHnFvx3hnoqe8eeY=;
        b=fQQ7hzusqcO2Mb5AQ960t54PR7FMZocWeAtbfCtyJZAV8i6B9OQAivVlHoDnpsFN2k
         Qm1kdgueLRMJUOcbbfNh5RyCkx+scTiJF9FIL0O7an83YsYxsSTrbLNqkX+zGQom84FX
         /cojomOG2sUxoe2p0zFMkAJIPsHSCKdsdkithdcPNeURi7RxIJBkg79qbywfJVZiuyNA
         gNhKkyPv5XnliYrKT9IpuCN0GOj2XzFFZVpkj/kqWfUObmt7Y2qSlZNGLazWfyhr7Puk
         1JsD4mwjtElm4HEK4vJ/PS3VV2CPQtjdj0Tui/QqCQS8H3gOGSjqnXec+bQZHK6nBCUw
         ytPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664007; x=1691256007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9ea0Od7Ss8KSCo0Ba6GtQFVksMPHnFvx3hnoqe8eeY=;
        b=JqitOGUPa3Wn69F00Oh5DM41J2TfkB1lfgoSMdDi1TXuDhEZOBWcxFDf6iaC51p+U4
         BobYMmC99Ab5sUinIZLDX/9igcZLQvKnoqCUK7Kg8uTMoZpvd0OYCsqCHStcyT2CA2VR
         5hGDtPwA4t/uSoSqqedDJVZiX9ehC3kh/8+9m3vsEHRaqnisje9AxAklhZ7Geh4fxo0u
         dcCykR5XHYmjMw9XTZ3LQs7hhqD0rJ41vquHOJBNspVdHAiGGuxkcScSXYBcPqdjjx0H
         f0GECCVrugbYchGeH1QdH7SxMB9DG6M2WzMidmzh82DV4WxHrN6Oi6qyJt7q33xwKyfn
         mQug==
X-Gm-Message-State: ABy/qLa9BMBOgTF3Sek7+/Ji9q2elAg2G0cZM2PYJ6EV+AeeCeoENHWL
        QNuIEmPJ/fqSTjByVE9SPpLZzQ==
X-Google-Smtp-Source: APBJJlGIzD3wgfXmLqpF5j/wbpDQeS0eCZKqUWowt+GLYOi3W+0iK2Ooqw2rQRyVOs7PEhn81abgMw==
X-Received: by 2002:a17:90a:c690:b0:262:c974:6057 with SMTP id n16-20020a17090ac69000b00262c9746057mr1931210pjt.32.1688664007220;
        Thu, 06 Jul 2023 10:20:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b0a5:7a22:4bcf:c911])
        by smtp.gmail.com with ESMTPSA id az9-20020a056a02004900b00519c3475f21sm1431884pgb.46.2023.07.06.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:20:06 -0700 (PDT)
Date:   Thu, 6 Jul 2023 11:20:03 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Trilok Soni <quic_tsoni@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Message-ID: <ZKb3wz2eXS6h1yIW@p14s>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <cc30660f-dd72-aade-6346-a93c6ad4b695@quicinc.com>
 <29af84dc-7db8-0c43-07b6-eb743cf25e57@linaro.org>
 <957a3cdb-6091-8679-ddb0-296db2347291@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957a3cdb-6091-8679-ddb0-296db2347291@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 03, 2023 at 02:05:58PM -0700, Trilok Soni wrote:
> On 7/2/2023 1:29 AM, Krzysztof Kozlowski wrote:
> > On 30/06/2023 18:04, Mukesh Ojha wrote:
> > > > 
> > > > > We don't add layers when they are not needed, and never when there is no
> > > > > actual user.  If you need the extra "complexity" later, then add it
> > > > > later when it is needed as who knows when that will ever be.
> > > > > 
> > > > > Please redo this series based on that, thanks.
> > > > 
> > > > My bigger issue with this whole series is what would this all look
> > > > like if every SoC vendor upstreamed their own custom dumping
> > > > mechanism. That would be a mess. (I have similar opinions on the
> > > > $soc-vendor hypervisors.)
> > 
> > Mukesh,
> > 
> > LPC CFP is still open. There will be also Android and Kernel Debugging
> > LPC microconference tracks. Coming with a unified solution could be a
> > great topic for LPC. Solutions targeting only one user are quite often
> > frowned upon.
> 
> LPC is far out and in November. Can we not have others speak up if they have
> the similar solution now? We can expand this to linux-kernel and ask for the
> other SOC vendors to chime in. I am sure that we may have existing solutions
> which came in for the one user first like Intel RDT if I remember. I am sure
> ARM MPAM usecase was present at that time but Intel RDT based solution which
> was x86 specific but accepted.

I am not familiar with Intel RDT and Arm MPAM but the community is always
improving on the way it does things.

LPC is indeed far out in November but it is an opportunity to cover the
groundwork needed to have this discussion.  It is always best to improve on
something then introduce something new.  Even better if something specific such
as Intel RDT and Arm MPAM can be made more generic.  A perfect example is
hwtracing Linus referred to.  The perf framework wasn't a perfect fit but it was
enhanced to accommodate our requirements.  I suggest to look at what is currently
available and come up with a strategy to be presented at LPC - event better if
you have a prototype.  If you can't find anything or the drawbacks inherent to
each avenue outweigh the benefits then we can have that conversation at LPC.

> 
> ---Trilok Soni
