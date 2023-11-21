Return-Path: <linux-remoteproc+bounces-1-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346267F22B9
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Nov 2023 02:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF8C8B2179B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 21 Nov 2023 01:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6FC17ED;
	Tue, 21 Nov 2023 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IxVh4TNX"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D617EA
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Nov 2023 01:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0494C433C9;
	Tue, 21 Nov 2023 01:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528462;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=IxVh4TNXYShV76QIhivImPSPPbxiOznWaUYrXGLlJuMMX1OZAnpBDWSvUvrH1vXA3
	 OmhyhsgIDIUyHhhOB7bmYA3DoC/z+2yGpVB6MCIm8ac3Fmf7yKK/ezR7WPKJSSWRJ0
	 kh8yN2u/i+DVBiY8+IPszVbZH3j7xY2ICgpUe7tw=
Date: Mon, 20 Nov 2023 20:01:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-remoteproc@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-axiomatic-imported-bobcat-1ecdaf@nitro>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

