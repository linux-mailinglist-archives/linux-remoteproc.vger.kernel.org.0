Return-Path: <linux-remoteproc+bounces-674-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20D870942
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 Mar 2024 19:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29BEA1F219E5
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 Mar 2024 18:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BEA62142;
	Mon,  4 Mar 2024 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCRLWH2P"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A6162141
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 Mar 2024 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709576066; cv=none; b=FrcGTPX73W1wL3MtdizAvTOwKtbGm8LxGyA47CNWEPMDHVqnJ7Bv+pJDA/P0mNmXPPsfonGKTe9q2JBBltj8W7ijVxckhVyrWL4Fvbg62/0Qpk9N/TRybkfBetFTUMO8LDx1FD6wP5Oywv640uksQ0x0S7eQ8BCsMayq/psA3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709576066; c=relaxed/simple;
	bh=QNGC7Dsi9roLy5jQAymqERMpAqi1lwb3tWPINkNo5WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCm1yKZXkdIPagarB6lhqJ8Q3i7M+AV4tHqlMgMgNBuAFvPSVLpgtJp6bjfAXRlXQlYColxFJGBuQHpj/i2ZutKG5SzL+OgvVM7kUdIcdNKYXLU7T9tZKpbIOkN4L31G1JgljsJygk0BJBtscOkHTKhvg7nNJz71aZK8IvRTPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCRLWH2P; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607e54b6cf5so32307767b3.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Mar 2024 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709576064; x=1710180864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kTdG46h6upx6Y3pqy4jdUCMvsV8yx7G/keZC/3Dml0E=;
        b=tCRLWH2PjyljV2L1i+TmJBlJ+OQCya1VLg0WeXZBm9hZENe7D+IhXVr/3ZOiudGahP
         csOIEuNRMT01Rf6DNlwgisxK0YFqER3WjZWNhs45wayHljf1DM15RCnmRR/eXGzGtk5n
         dXWlcbQQvSyKadEYXU9AXgQm1o85qLCYrz2Vzt7ktqiPloZpRz5ZfAfCshMQok9KUNyL
         X7YouF9CqdYOL1fy8X7ScpCiP+Xuu6mPagCSf7xGIuuOM0JH/PtHUtEPAtsTJou8f3I6
         EBVEF6kZQ4xI2DrJzGSFhPgltNqYYEuUlZZxcg8U3G2pDg7hxUs3axUjKwM7IkzNJavW
         gXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709576064; x=1710180864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTdG46h6upx6Y3pqy4jdUCMvsV8yx7G/keZC/3Dml0E=;
        b=FpuHSz4Rx6gO+83LedLgtrgBVPX9njv0M+3VVFzBDxv7iJQe3YAXSAwqyvOIN9cOAb
         sc62r/xcXaU4NlcS2PDE9etv94mPpupw56UtsIxI+fncbtwQy9z56yyHDD3Q8QYReQFn
         RYvG2eNHHve+6szvyTzeA+QOQyFhy5RL48cpYlPfjbLiA6hsg+3k/aR+lRInH9NoWrGE
         GPZBuLxbaHHBP5G1wwCGgIGodVvl1CJHLTV/0Y/TbJMDbFMR7ej4hw71CIutZfUuWrru
         O/IZHeXxNcJNwyPA8LDCvflm75plWkkUNujOdJ8An6fo6rTt0lHHxNnhOiio+6FUfPoD
         Z0pw==
X-Forwarded-Encrypted: i=1; AJvYcCVCDLGkE7qy8v+c4pZjmL7/5uBAuYbbVbNG+dNMS8mlL/PxDBZSbaLlES+/gFB77yCaWzUc81xC62cw489tymgBTFh6k+3KmsQUmbW5jNxePA==
X-Gm-Message-State: AOJu0YxO04AUZwPXyAISZuAKaOOE/jUZGEDA+m2Z29D8UNEZE+KT9vbV
	InTRKgtPBkEE8+CkrQibHUXGNDXcS98Q95VUdQ5fMwpIYX1/LMnBUo1ySc0/PreZXhqnV5rTsBI
	nqSW7aQ5508/8t26E+FyRc1V08sBpZ3pe+u9lurCYmxSw1d+EAMk=
X-Google-Smtp-Source: AGHT+IEAvbC1cdXnq50wTR+qMj0Tr4rMd0F/X/0DexlHv3pOKf2qriYZN0FkgmEObrKd8Ddg5CEE4v0AMIXTde3PUs0=
X-Received: by 2002:a81:c748:0:b0:609:456e:683b with SMTP id
 i8-20020a81c748000000b00609456e683bmr261324ywl.14.1709576064287; Mon, 04 Mar
 2024 10:14:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
 <20240304-qcom-pd-mapper-v3-2-6858fa1ac1c8@linaro.org> <c5abc503-2019-46d4-bbfd-8295bc0240fb@linaro.org>
In-Reply-To: <c5abc503-2019-46d4-bbfd-8295bc0240fb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 20:14:13 +0200
Message-ID: <CAA8EJpry1-RztbfCd8CTeoJp25Tw7NAijZjd3G+VVYgU_yCQgg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/7] soc: qcom: qmi: add a way to remove running service
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 19:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 3/4/24 18:03, Dmitry Baryshkov wrote:
> > Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> > running server from the QMI socket. This is e.g. necessary for
> > pd-mapper, which needs to readd a server each time the DSP is started or
> > stopped.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +
> > +     list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
> > +             if (svc->service != service ||
> > +                 svc->version != version ||
> > +                 svc->instance != instance)
> > +                     continue;
> > +
> > +             qmi_send_del_server(qmi, svc);
> > +             //list_del(&vc->list_node);
> > +             //kfree(svc);
>
> foo

Ugh, I had that disabled at some point and forgot to re-enable.


-- 
With best wishes
Dmitry

