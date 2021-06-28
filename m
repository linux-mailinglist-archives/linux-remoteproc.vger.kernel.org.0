Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4E33B681F
	for <lists+linux-remoteproc@lfdr.de>; Mon, 28 Jun 2021 20:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhF1SOG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 28 Jun 2021 14:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbhF1SOE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 14:14:04 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5902FC061766
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 11:11:38 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id h4so16126930pgp.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3CTgejj7lyDfhzX2dzFowMolpFgct9NOBpKU9MNvQtw=;
        b=Sc6OqygxSFouqdOlogrAUiHLeOwpITrPTjkw/k2XBGHIR+ewdts2BLoNOigqRunYY2
         NQfK/sE2nm+OPBV+wUEon7YtBOPCs8oGY0fBiCUk9MwRI23Ywn7rQLdX7tC+JbwduDcI
         8mWebW8GUvPLzfIeXg3Ys58oS241vhtkwLq8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3CTgejj7lyDfhzX2dzFowMolpFgct9NOBpKU9MNvQtw=;
        b=AmEY46gJZhfocXGei9SdAa3CtFj7xWLQOlkow+w5IJ5U9hmHMjpKsZvpK82VnihLaI
         bBVZd6U0vFoSmpuzFNDoWt5XP9NtT9M3k0S2s6X0UE3MFL1Zmm13bQNzupkdCPAvV66i
         g6MykNugaUMPZTWlUhAqXXMd2ddIKF7AGe8hgMG/ghEdEVPReR2TmltI0v6bef6+UE9b
         5kL7++vGqCdXTsW25r1T3TDEdQ6JFkOeJt2L8qGh1gjFj++ABUfM1qbraVbjXH/BMjsA
         oIcld7ZK6vb5+Le7UGz0SJ4Oyk3J701aTRu3nG59OescvPfJTN6LvL9j16mbr8ngL9WB
         Xuwg==
X-Gm-Message-State: AOAM531dhx8tTOWInyi8eyawoy5wzCX+smrtb7TemLw+XvE/m3Cd0Hti
        nyoq3zl4Foqu7EoGM6tgnDYjlA==
X-Google-Smtp-Source: ABdhPJwDDSKq52s0pA5ZRq7/h6wngl4jVxfxRf//SwJNyTD1XT3Z5MwE0vonZHCEmP2mLfWZPTi04g==
X-Received: by 2002:a62:174c:0:b029:30d:fab7:ef5a with SMTP id 73-20020a62174c0000b029030dfab7ef5amr923165pfx.75.1624903897438;
        Mon, 28 Jun 2021 11:11:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:df70:d2d8:b384:35cf])
        by smtp.gmail.com with UTF8SMTPSA id x13sm15787159pjh.30.2021.06.28.11.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 11:11:37 -0700 (PDT)
Date:   Mon, 28 Jun 2021 11:11:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sc7280: Update reserved memory map
Message-ID: <YNoQ1d1hUyIh/qxz@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:35AM +0530, Sibi Sankar wrote:

> Subject: arm64: dts: qcom: sc7280: Update reserved memory map

That's very vague. Also personally I'm not a fan of patches that touch
SoC and board files with a commit message that only mentions the SoC, as
is frequently done for IDP boards. Why not split this in (at least) two,
one for adding the missing memory regions to the SoC, and one for the
IDP.

> Add missing regions and remove unused regions from the reserved memory
> map, as described in version 1.

What is this 'version 1'?

