Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8603D04DD
	for <lists+linux-remoteproc@lfdr.de>; Wed, 21 Jul 2021 00:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhGTWNp (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 20 Jul 2021 18:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhGTWM4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jul 2021 18:12:56 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA6BC061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 15:53:33 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y4so759558pfi.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WFljwGE5zMM7TMbgT2VWMf4eY/se69wd7M/vyt+M0Ww=;
        b=IUzpy6Mplc1g+mog/62U+EFadLcMrTs0aX64K98X9/PM5Vhh03KtvTYzKjLgNeqiKR
         tryRQ7kJnV4PA6GgitUsccSbsrfNxoBjlqBBOw9XOUQTW07ertY66b3fmo6Oy6/YPgSp
         Noc7eT3wvMnv/vMsd8zcpQtvvGx9xzMPmR2h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WFljwGE5zMM7TMbgT2VWMf4eY/se69wd7M/vyt+M0Ww=;
        b=oEqXrTN5PjBloCL9jjj9/v+r4w1fQ7EUC2DVIwFa7g77hZDnLiu/t3Zqdf03gNDp+7
         jiz+I/6igeUF/b330XOozmfgVNjPa7tlg/kZZvzpAIjUE7SWG9yaO1xWJZ6AHNxZ2TL6
         rLnBrrFrzqQl1nh4jgGIQpOnF1KFaSPXvETSuPVM75LSos1YgkIEZbpWr00iZuPM2lhD
         q1FV5MabiH7M05Acefb5xNLUioxa0/60N3BEjU4VxGwMAVEVX/cjP1l/IE7d/W1UlpGI
         VONpB3HY/XMlBU5vZdpZysK5Mh2xkHvI6u2X9rc1P1FjCSezKx/qvUAPk54b2xCQ8Oj3
         ETIw==
X-Gm-Message-State: AOAM533nxFV+KVKD20Tw7sx6Lk5Zg0NjQuyzmiBEZSk0Ybcny4LdIwcZ
        wG7imc1GgYwdsadkeUlkHMLhGQ==
X-Google-Smtp-Source: ABdhPJzJIj9tlMtsjbqeJVALwI494jvDta7Bm/uEWyfZSNcRVepDHblwpV+2vucddjFxP2K10hnYOA==
X-Received: by 2002:a63:2308:: with SMTP id j8mr29164907pgj.166.1626821613500;
        Tue, 20 Jul 2021 15:53:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c9c3:db46:7281:8e32])
        by smtp.gmail.com with UTF8SMTPSA id j2sm26172002pfb.53.2021.07.20.15.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 15:53:32 -0700 (PDT)
Date:   Tue, 20 Jul 2021 15:53:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 11/13] soc: qcom: aoss: Drop power domain support
Message-ID: <YPdT6xEqs2rVLdfQ@google.com>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-12-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626755807-11865-12-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 20, 2021 at 10:06:45AM +0530, Sibi Sankar wrote:
> Strip out the load state power-domain support from the driver since the
> low power mode signalling for the co-processors is now accessible through
> the direct qmp message send interface.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
