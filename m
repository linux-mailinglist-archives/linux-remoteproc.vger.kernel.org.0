Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE4848F5ED
	for <lists+linux-remoteproc@lfdr.de>; Sat, 15 Jan 2022 09:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiAOIJn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 15 Jan 2022 03:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiAOIJn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jan 2022 03:09:43 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC638C06161C
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Jan 2022 00:09:42 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id e81so15620769oia.6
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Jan 2022 00:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vfhunlj9nQmQKNmF7Wj+BYTeOFfCavkVzFjEDPkYdiE=;
        b=i+bcdAa9vVPOaIjwQ7K+m8bgWBs2sGdOc3rp9SxWgfPWinzTLJCfkGt9spA8KJ9Di3
         n/Uf/zfIAQC0Mu5oqzMTS8wGG5v8/Iu7UAGA3CwXGWmv4ULHmexDaPjLMoryPvnYO7lr
         BCW2O1kmRCouONOqeHvhyxTwxZhzgwj9M9UDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vfhunlj9nQmQKNmF7Wj+BYTeOFfCavkVzFjEDPkYdiE=;
        b=hZn7u52/s4ThsgFO3EUOk8hqytdLX1tIXmbeLKlyrIUflTtQc99KMkpemxsvp7huuZ
         98hC8heIdzPA/Nz7GfvjLNORaPtaLkvS7Ejq3kKdpCKYM+bOyicVcFdtblI86qTlMxhy
         VmNRxrhl0M+4AJqUG/zXjOeZwVaPIgPMsi5TP6a5046uysqw2ecSQ2oGrTOOQ/VdzUv7
         iSP5D89SVINn5k4oV1HiKUoLogFAGA2bYEXIKySbwHIlZiBR1Xa/9SgDSjtdSGBeXzp5
         Jcu/uwtxCE3SvSDoLaQhabVixxJATOJ+J2+9dado1aA5X1tKXJv4Pf6o724VEecldvie
         kzgg==
X-Gm-Message-State: AOAM532hUheci6X4jqr3v7GOdIHIPVCuxVhTKew69hBHi8NRnVsa5lzF
        YUgbtB0lnTN9Y9lpPFC+0a7OBqD/G0X4cEN1SC+HP0ozbng=
X-Google-Smtp-Source: ABdhPJzoiOosGWLxjp+CHkMjoztQPbXGKMRKAVC5I4mWHIH9Iu8JH7ikpQNtcfA4CJYQUftjdF/JNAJKh8n+WaWqjHM=
X-Received: by 2002:aca:4382:: with SMTP id q124mr10403906oia.64.1642234182123;
 Sat, 15 Jan 2022 00:09:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Jan 2022 02:09:41 -0600
MIME-Version: 1.0
In-Reply-To: <20220115011338.2973-1-rdunlap@infradead.org>
References: <20220115011338.2973-1-rdunlap@infradead.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sat, 15 Jan 2022 02:09:41 -0600
Message-ID: <CAE-0n50w=dvD=UQyeFvwq6W6E2p3M6zy2yO9V5ah1GFwKq4AJg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: fix service routines build errors
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Randy Dunlap (2022-01-14 17:13:38)
> When CONFIG_QCOM_AOSS_QMP=m and CONFIG_QCOM_Q6V5_MSS=y, the builtin
> driver cannot call into the loadable module's low-level service
> functions. Trying to build with that config combo causes linker errors.
>
> There are two problems here. First, drivers/remoteproc/qcom_q6v5.c
> should #include <linux/soc/qcom/qcom_aoss.h> for the definitions of
> the service functions, depending on whether CONFIG_QCOM_AOSS_QMP is
> set/enabled or not. Second, the qcom remoteproc drivers should depend
> on QCOM_AOSS_QMP iff it is enabled (=y or =m) so that the qcom
> remoteproc drivers can be built properly.
>
> This prevents these build errors:
>
> aarch64-linux-ld: drivers/remoteproc/qcom_q6v5.o: in function `q6v5_load_state_toggle':
> qcom_q6v5.c:(.text+0xc4): undefined reference to `qmp_send'
> aarch64-linux-ld: drivers/remoteproc/qcom_q6v5.o: in function `qcom_q6v5_deinit':
> (.text+0x2e4): undefined reference to `qmp_put'
> aarch64-linux-ld: drivers/remoteproc/qcom_q6v5.o: in function `qcom_q6v5_init':
> (.text+0x778): undefined reference to `qmp_get'
> aarch64-linux-ld: (.text+0x7d8): undefined reference to `qmp_put'
>
> Fixes: c1fe10d238c0 ("remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
