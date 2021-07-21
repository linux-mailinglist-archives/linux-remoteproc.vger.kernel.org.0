Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D488D3D086D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 21 Jul 2021 07:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhGUFBm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 21 Jul 2021 01:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhGUFBf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 01:01:35 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56898C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:42:11 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u11so1764939oiv.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yn3SLEtGrnNfwdp8zANxEksIpTaatEzvZGDUvJ5yALU=;
        b=ae5j2EzpGtuXwAbPSvNGt6tgH6AqCaLDqHX2YkL0p8fS+ucDufJO+b6k9ZCdOwSDN2
         aPQc7GSFJPOpL0viYXlquxZPqWUgQdDxt2xmZCWCzWWHBp1ZrIET5OSK4FVA7OBOetWq
         mEJQ7JEcqqBLR8VzyHS3OU86L3DZbd58x2VNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yn3SLEtGrnNfwdp8zANxEksIpTaatEzvZGDUvJ5yALU=;
        b=mCEo24g7rkSWP5rnxVCvmn1KV3qMxSMewCxsSu7Qv2/jE8TLpOfr6RfPIR3SIIS1/I
         DUYpoypkEeilf1lCmqrGKqD5v/lGumgMHZz0nz5PYY3cm8NFL7PiLZ3SQsx32xdsVx9l
         oTCqeScIIGPvaU4Ac97dMjR8dU6NiI3LeXGRPRGgwWtAbhaGk2ZaN459Lq3C7Y9SiFSo
         vqn5btD+8N/C+YH3RZsvU2DstlnNR+ebt8VxiwcECodg2A+qPSxfK+/zHt2+KKsOjDB/
         RsGHvFS8V2Qpk65OiNolBplxJDoxlrCthxIRuWl/PLN5PEYLYyHUmF/3xAEViR/x85K/
         NY7Q==
X-Gm-Message-State: AOAM530wl1/kJEsJNorzF/jk4XkF8TjuGeN9hH4267KmNiuDALvMnjda
        H9fbkMtUZAKCjiO1HyLF4KkI6az1tDFuBEfgEixJ4Q==
X-Google-Smtp-Source: ABdhPJxUFAzspP8McapgCPeAK14FnM/LtUjXph+HodzKkcRBPUX+lSMVfXk/k+z1Osdg64ahuRMzKP00aYXVoN8K3AE=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4799833oiu.19.1626846130824;
 Tue, 20 Jul 2021 22:42:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:42:10 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-7-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-7-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:42:10 +0000
Message-ID: <CAE-0n502Qqtv1J8oJgp2+GV5Vz0k0V-bEXmrFPDD-Zp0cS7=Rg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: sc7280: Update reserved memory map
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:56)
> Add missing regions to the reserved memory map.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
