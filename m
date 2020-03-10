Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09161805F3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 19:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgCJSL0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 14:11:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37984 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgCJSL0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 14:11:26 -0400
Received: by mail-pg1-f195.google.com with SMTP id x7so6663038pgh.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=S+pLjMqdeN6mnY8CQehC3nBw/yA6NMpCjF8qbgxUBM1lcueUbng2IKM5q69nW9YMLI
         1K9oW8b1DaZDeSNKGBvlwA1Q+d9J2pBu/3a4VL6E7nlJ3ZWwc2zSouHg+21N2OJ6NviD
         shULJYOBdJPXnC8VaRxjyev4hoQU5eXx2v66k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yrVZjd8gZ0Ysia7WKkOlNyA8gHSCOfIvJw2hn5fXOTo=;
        b=ZLnLSjPKpUkFxPyEpOUKJoATdUvDRTsCYIzxWVFtTSIhUf92z1CPCtDUyZCu9GrMBw
         wa7baqeqhXOsFcX0k6uJ53eOepnge9xWX858/0rdVv+WVYnW/yPaToglIVgbdazUZQwy
         s/O1D21x3BTAV8WiltgkJ09haL1xMRqm6RyajTQLR7zQHm1u+Th8t/crFAbq0ICwSaD1
         dnmb2ni2BqGE4rdWgfT1dsW8AMW4aVIosSpRkCFn/3knaR/HpiCS8q6dxg44JWWizO7B
         SjdVx6ym3Xle4sw6R+RqXSijt7XWLntNIK8VHreuQDPGIhX/DjT0DXK2SsrFwFCDmmVl
         d/Ag==
X-Gm-Message-State: ANhLgQ2QejeyceSB4MyeyHBuaNL++5BCexUFR+eJJaEMCxV6opWRo6JG
        FdOGPtkIxe/0YEHT7KvXnmGvSA==
X-Google-Smtp-Source: ADFU+vuipIwBt7HZ/eXbGMHyK0C9Xm3ciUBrtc453qCMfM4q/YxsgsKOtlO41E3QCYP95HQyqRhlwA==
X-Received: by 2002:a63:7e10:: with SMTP id z16mr6992656pgc.412.1583863885067;
        Tue, 10 Mar 2020 11:11:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c17sm27415625pfo.71.2020.03.10.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:11:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-5-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-5-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:11:23 -0700
Message-ID: <158386388355.149997.17460216194595657584@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:37)
> Add a simple-mfd representing IMEM on QCS404 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
